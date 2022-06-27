defmodule MicroBlogApiWeb.AuthController do
  use MicroBlogApiWeb, :controller

  alias MicroBlogApi.Auth
  alias MicroBlogApiWeb.Token

  action_fallback(MicroBlogApiWeb.AuthFallbackController)

  def auth(conn, params) do
    with {:ok, user} <- Auth.AuthServices.auth(params) do
      conn
      |> put_status(:ok)
      |> put_view(MicroBlogApiWeb.AuthView)
      |> render("login.json", %{user: user, token: Token.create_token(user)})
    end
  end
end
