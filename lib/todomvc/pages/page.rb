# frozen_string_literal: true

module Todomvc
  module Pages
    class Page < SitePrism::Page
      set_url "/"
      load_validation { has_new_todo_input_element? }

      sections :item_sections, ItemSection, :css, "ul.todo-list > li", wait: false

      element :header_title_element, :css, "header.header > h1"
      element :new_todo_input_element, :css, ".new-todo"
      element :toggle_all_element, :css, "label[for='toggle-all']"
      element :counter_element, :css, "span.todo-count"
      element :all_filter_element, :xpath, "//ul[@class='filters']//a[text()='All']"
      element :active_filter_element, :xpath, "//ul[@class='filters']//a[text()='Active']"
      element :completed_filter_element, :xpath, "//ul[@class='filters']//a[text()='Completed']"
      element :clear_completed_button_element, :css, "button.clear-completed"

      def enter_new_item_label(label)
        new_todo_input_element.set(label)
      end

      def press_key(key)
        page.driver.browser.switch_to.active_element.send_keys(key)
      end

      def toggle_item_status(label)
        item_section(label).toggle_element.click
      end

      def double_click_on_item(label)
        item_section(label).label_element.double_click
      end

      def add_new_items(labels)
        labels.each { |label| add_new_item(label) }
      end

      def add_new_item(label)
        enter_new_item_label(label)
        press_key(:enter)
      end

      def complete_items(labels)
        labels.each { |label| complete_item(label) }
      end

      def complete_item(label)
        item_section(label).complete
      end

      def delete_item(label)
        item_section(label).delete
      end

      def item_section(label)
        item_sections.find { |section| section.label == label }
      end

      def select_filter(filter)
        send("#{filter.downcase}_filter_element").click
      end

      def clear_completed
        clear_completed_button_element.click
      end

      def placeholder_text
        new_todo_input_element["placeholder"]
      end

      def toggle_all
        toggle_all_element.click
      end

      def counter_text
        counter_element.text
      end

      def item_present?(item)
        !item_section(item).nil?
      end
    end
  end
end
