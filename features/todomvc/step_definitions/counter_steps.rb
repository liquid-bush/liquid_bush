# frozen_string_literal: true

Then("active items counter shows {string}") do |text|
  expect(@page.counter_text).to eq(text)
end
