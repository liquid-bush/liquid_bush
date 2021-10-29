# frozen_string_literal: true

module Jsonplaceholder
  module Models
    class Comment
      attr_reader :id,
                  :name,
                  :body,
                  :post_id

      def initialize(params)
        @id = params[:id]
        @name = params[:name]
        @body = params[:body]
        @post_id = params[:post_id]
      end
    end
  end
end
