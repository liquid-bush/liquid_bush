# frozen_string_literal: true

module Todomvc
  module Items
    class Factory
      def new_item
        "thing ##{rand(1_000_000)}"
      end

      def new_items(count)
        count.times.map { new_item }
      end
    end
  end
end
