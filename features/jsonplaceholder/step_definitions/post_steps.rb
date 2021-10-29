# frozen_string_literal: true

When("user requests all posts") do
  @posts = @client.all_posts
end

When("user requests all posts created by the user with id {int}") do |user_id|
  @posts = @client.all_posts(user_id: user_id)
end

When("user requests post with id {int}") do |post_id|
  @post = @client.post_by_id(post_id)
end

When("user creates a new post:") do |table|
  params = table.hashes.first
  @post = @client.create_post(params)
end

When("user updates a post:") do |table|
  post_id = 1 # we don't care what post will we update
  post = @client.post_by_id(post_id)
  params = table.hashes.first
  @post = @client.update_post(post, params)
end

Then("posts count is {int}") do |count|
  expect(@posts.count).to eq(count.to_i)
end

Then("user deletes a post") do
  post_id = 1 # we don't care what post will we update
  post = @client.post_by_id(post_id)
  @client.delete_post(post)
end

Then("all returned posts are created by the user with id {int}") do |user_id|
  expect(@posts.map(&:user_id).uniq).to eq([user_id])
end

Then("next post is returned:") do |table|
  params = table.hashes.first

  aggregate_failures do
    params.each do |k, v|
      expect(@post.send(k).to_s).to eq(v)
    end
  end
end

When("user requests all comments for the post with id {int}") do |post_id|
  post = @client.post_by_id(post_id)
  @comments = @client.post_comments(post)
end

Then("comments count is {int}") do |count|
  expect(@comments.count).to eq(count.to_i)
end

Then("all returned comments are related to the post with id {int}") do |post_id|
  expect(@comments.map(&:post_id).uniq).to eq([post_id])
end
