# frozen_string_literal: true

module Jsonplaceholder
  class Client
    attr_reader :posts_api, :comments_api

    def initialize(hostname)
      @posts_api = Api::PostsApi.new(hostname)
      @comments_api = Api::CommentsApi.new(hostname)
    end

    def all_posts(params = {})
      hashes = posts_api.list(params).safe_parsed_body
      hashes.map { |hsh| Models::Post.new(hsh) }
    end

    def post_by_id(id)
      hsh = posts_api.view(id).safe_parsed_body
      Models::Post.new(hsh)
    end

    def create_post(params)
      hsh = posts_api.create(params).safe_parsed_body(status: 201)
      Models::Post.new(hsh)
    end

    def update_post(post, params)
      hsh = posts_api.update(post.id, params).safe_parsed_body
      Models::Post.new(hsh)
    end

    def delete_post(post)
      posts_api.destroy(post.id).verify_status(200)
    end

    def post_comments(post)
      hashes = comments_api.list(post.id).safe_parsed_body
      hashes.map { |hsh| Models::Comment.new(hsh) }
    end
  end
end
