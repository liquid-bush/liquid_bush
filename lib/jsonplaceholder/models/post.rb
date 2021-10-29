# frozen_string_literal: true

module Jsonplaceholder
  module Models
    class Post
      attr_reader :id,
                  :title,
                  :user_id

      def initialize(params)
        @id = params[:id]
        @title = params[:title]
        @user_id = params[:user_id]
      end
    end
  end
end
