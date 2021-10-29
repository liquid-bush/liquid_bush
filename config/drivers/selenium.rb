# frozen_string_literal: true

Capybara.register_driver :selenium do |app|
  args = %w[start-fullscreen window-size=1920x1080]
  args += %w[headless disable-gpu no-sandbox] unless ENV["RUN_WITH_UI"]&.downcase == "true"

  raw_options = {
    args: args
  }
  options = Selenium::WebDriver::Chrome::Options.new(raw_options)

  Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: options)
end
