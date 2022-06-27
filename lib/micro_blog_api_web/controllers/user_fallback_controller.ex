defmodule MicroBlogApiWeb.UserFallbackController do
  use MicroBlogApiWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(MicroBlogApiWeb.ErrorView)
    |> render("400.json", changeset: changeset)
  end

  def call(conn, {:no_result, message}) do
    conn
    |> put_status(:not_found)
    |> put_view(MicroBlogApiWeb.ErrorView)
    |> render("404.json", message)
  end
end
