# frozen_string_literal: true

When("user enters {string} text into new todo input") do |text|
  @item = text
  @page.enter_new_item_label(@item)
end

When("user adds new item to the list") do
  step("user has 1 active item in the list")
end

When("user adds the same item in the second time") do
  @page.add_new_item(@item)
end

Then("both items appear in the list") do
  labels = @page.item_sections.map(&:label)
  expect(labels).to eq([@item, @item])
end

Then(/^(?:new )?item (?:is present|appears) in the list$/) do
  expect(@page.item_section(@item)).not_to be_nil
end

Then("new item appears in the list as {string}") do |text|
  expect(@page.item_section(text)).not_to be_nil
end

Then("new item appears in the end of the list") do
  expect(@page.item_sections.last.label).to eq(@item)
end

Then("no items appear in the list") do
  expect(@page.item_sections).to be_empty
end
