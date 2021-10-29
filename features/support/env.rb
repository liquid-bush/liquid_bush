# frozen_string_literal: true

require "bundler/setup"

Bundler.require(:default)

require "capybara"
require "capybara/cucumber"

require_relative "../../config/capybara"

require_relative "../../lib/todomvc"
require_relative "../../lib/jsonplaceholder"
