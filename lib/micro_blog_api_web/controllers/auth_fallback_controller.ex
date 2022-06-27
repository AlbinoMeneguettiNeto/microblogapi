defmodule MicroBlogApiWeb.AuthFallbackController do
  use MicroBlogApiWeb, :controller

  def call(conn, {:unauthorized, message}) do
    conn
    |> put_status(:unauthorized)
    |> put_view(MicroBlogApiWeb.ErrorView)
    |> render("401.json", message)
  end

  def call(conn, {:no_result, message}) do
    conn
    |> put_status(:not_found)
    |> put_view(MicroBlogApiWeb.ErrorView)
    |> render("404.json", message)
  end
end
