# frozen_string_literal: true

module Jsonplaceholder
  module Api
    class CommentsApi < BaseApi
      def list(post_id, params = {})
        get("/posts/#{post_id}/comments", params: params)
      end
    end
  end
end
