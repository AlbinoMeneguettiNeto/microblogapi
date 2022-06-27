defmodule MicroBlogApiWeb.AuthPlug do
  import Plug.Conn

  alias MicroBlogApiWeb.Token

  def init(opts), do: opts

  def call(conn, _opts) do
    with ["Bearer " <> token] <- get_req_header(conn, "authorization"),
         {:ok, %{id: user_id, email: _email}} <- Token.verify_token(token) do
      assign(conn, :user_id, user_id)
    else
      [] -> handle_error(conn)
      {:error, _reason} -> handle_error(conn)
    end
  end

  defp handle_error(conn) do
    conn
    |> put_status(:unauthorized)
    |> Phoenix.Controller.put_view(MicroBlogApiWeb.ErrorView)
    |> Phoenix.Controller.render("401.json")
    |> halt()
  end
end
