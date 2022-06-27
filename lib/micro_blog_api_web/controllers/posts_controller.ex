defmodule MicroBlogApiWeb.PostsController do
  use MicroBlogApiWeb, :controller

  alias MicroBlogApi.Posts

  action_fallback(MicroBlogApiWeb.PostFallbackController)

  def create(conn, params) do
    with user_id <- conn.assigns[:user_id],
         {:ok, post} <-
           Posts.PostsServices.create(%{user_id: user_id, post: params["post"], likes: 0}) do
      conn
      |> put_status(:created)
      |> put_view(MicroBlogApiWeb.PostsView)
      |> render("201.json", post: post)
    end
  end
end
