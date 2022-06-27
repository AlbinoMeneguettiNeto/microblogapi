defmodule MicroBlogApi.Posts.PostsServices do
  def create(params), do: MicroBlogApi.Post.create(params)
end
