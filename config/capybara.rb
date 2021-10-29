# frozen_string_literal: true

require_relative "drivers/selenium"

Capybara.configure do |config|
  config.app_host = ENV["UI_APP_HOST"]
  config.default_max_wait_time = 5
  config.default_driver = :selenium
end
