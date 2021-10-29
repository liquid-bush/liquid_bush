# frozen_string_literal: true

Before("@todomvc") do
  @item_factory = Todomvc::Items::Factory.new
end

Before("@jsonplaceholder") do
  @client = Jsonplaceholder::Client.new(ENV["API_APP_HOST"])
end
