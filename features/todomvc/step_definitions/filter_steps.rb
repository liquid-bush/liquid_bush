# frozen_string_literal: true

When("user selects {string} filter") do |filter|
  @page.select_filter(filter)
end

Then(/^(active|completed) items? (is present in|disappears? from) the list$/) do |status, action|
  ui_items = @page.item_sections.select { |ui_item| ui_item.send("#{status}?") }
  expected_number = action == "is present in" ? 1 : 0
  expect(ui_items.size).to eq(expected_number)
end
