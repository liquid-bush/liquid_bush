# frozen_string_literal: true

module Todomvc
  module Pages
    class ItemSection < SitePrism::Section
      element :label_element, :css, "label", visible: false
      element :toggle_element, :css, "input.toggle", visible: false
      element :input_element, :css, "input.edit"
      element :destroy_button_element, :css, "button.destroy"

      def label
        label_element.text(:all)
      end

      def status
        case root_element[:class]
        when "completed"
          Items::COMPLETED_STATUS
        when ""
          Items::ACTIVE_STATUS
        else
          Items::UNDEFINED_STATUS
        end
      end

      def active?
        status == Items::ACTIVE_STATUS
      end

      def completed?
        status == Items::COMPLETED_STATUS
      end

      def complete
        toggle_element.click unless completed?
      end

      def update_text(new_text)
        input_element.set(new_text)
      end

      def hover
        label_element.hover
      end
    end
  end
end
