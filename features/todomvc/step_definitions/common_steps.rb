# frozen_string_literal: true

Given("user is on ToDo page") do
  @page = Todomvc::Pages::Page.new
  @page.load
end

Given("user has {int} active item(s) in the list") do |count|
  @items = @item_factory.new_items(count)
  @page.add_new_items(@items)

  @item = @items.first
end

Given("user has {int} completed item(s) in the list") do |count|
  step("user has #{count} active items in the list")

  @page.complete_items(@items)
end

When(/^user presses (enter|escape)$/) do |key|
  @page.press_key(key.to_sym)
end

When("user reloads page") do
  Capybara.refresh
end
