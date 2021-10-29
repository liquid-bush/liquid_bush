# frozen_string_literal: true

When("user clicks on item toggle") do
  @page.toggle_item_status(@item)
end

When("user completes an item") do
  @page.complete_item(@items.sample)
end

Then("item is marked as completed") do
  ui_item = @page.item_section(@item)
  expect(ui_item).to be_completed
end

Then("item is marked as active") do
  ui_item = @page.item_section(@item)
  expect(ui_item).to be_active
end
