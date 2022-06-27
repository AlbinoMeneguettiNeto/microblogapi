defmodule MicroBlogApiWeb.PostFallbackController do
  use MicroBlogApiWeb, :controller

  def call(conn, {:error, %Ecto.Changeset{} = changeset}) do
    conn
    |> put_status(:bad_request)
    |> put_view(MicroBlogApiWeb.ErrorView)
    |> render("400.json", changeset: changeset)
  end
end
