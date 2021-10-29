# frozen_string_literal: true

When("user clicks on toggle all button") do
  @page.toggle_all
end

Then("all items become completed") do
  expect(@page.item_sections.all?(&:completed?)).to be true
end

Then("all items become active") do
  expect(@page.item_sections.all?(&:active?)).to be true
end

Then("toggle all button is hidden") do
  expect(@page.has_no_toggle_all_element?).to be true
end
