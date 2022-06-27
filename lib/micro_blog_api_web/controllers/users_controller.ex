defmodule MicroBlogApiWeb.UsersController do
  use MicroBlogApiWeb, :controller

  alias MicroBlogApi.Users.Services

  action_fallback(MicroBlogApiWeb.UserFallbackController)

  def create(conn, params) do
    with {:ok, user} <- Services.create(params) do
      IO.inspect(user)
      conn
      |> put_status(:created)
      |> put_view(MicroBlogApiWeb.UsersView)
      |> render("user.json", user: user)
    end
  end

  def show(conn, %{"id" => id}) do
    with {:ok, user} <- Services.show(id) do
      conn
      |> put_status(:ok)
      |> put_view(MicroBlogApiWeb.UsersView)
      |> render("user.json", user: user)
    end
  end
end
