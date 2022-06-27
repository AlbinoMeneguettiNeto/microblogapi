defmodule MicroBlogApiWeb.PostsView do
  use MicroBlogApiWeb, :view

  def render("201.json", %{post: post}) do
    %{
      post: %{
        id: post.id,
        post: post.post,
        likes: post.likes,
        created_at: post.inserted_at
      }
    }
  end
end
