# frozen_string_literal: true

Then("{string} placeholder is shown in the new todo input") do |text|
  expect(@page.placeholder_text).to eq(text)
end
