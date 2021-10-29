# frozen_string_literal: true

module Jsonplaceholder
  module Api
    class PostsApi < BaseApi
      def list(params = {})
        get("/posts", params: params)
      end

      def view(id)
        get("/posts/#{id}")
      end

      def create(params)
        post("/posts", json: params)
      end

      def update(id, params)
        put("/posts/#{id}", json: params)
      end

      def destroy(id)
        delete("/posts/#{id}")
      end
    end
  end
end
