# frozen_string_literal: true

When("user hovers over the item") do
  @page.item_section(@item).hover
end

When("user clicks on delete button") do
  @page.item_section(@item).destroy_button_element.click
end

Then("item disappears from the list") do
  expect(@page.item_section(@item)).to be_nil
end
