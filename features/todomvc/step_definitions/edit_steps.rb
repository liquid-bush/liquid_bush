# frozen_string_literal: true

When("user double clicks on the item") do
  @page.double_click_on_item(@item)
end

When("user enters new label") do
  @new_item = @item_factory.new_item
  @page.item_section(@item).update_text(@new_item)
end

When("clear item text") do
  @page.item_section(@item).update_text(" ")
end

When("user clicks on header title") do
  @page.header_title_element.click
end

Then("item should be updated in the list") do
  expect(@page.item_present?(@new_item)).to be true
end

Then("item should not be updated in the list") do
  expect(@page.item_present?(@item)).to be true
end
