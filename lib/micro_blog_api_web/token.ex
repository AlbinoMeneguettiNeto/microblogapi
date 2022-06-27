defmodule MicroBlogApiWeb.Token do
  alias Phoenix.Token
  alias MicroBlogApi.User
  alias MicroBlogApiWeb.Endpoint

  @salt "private_banana"
  @ttl 86400

  def create_token(%User{id: user_id, email: email}) do
    Token.sign(Endpoint, @salt, %{id: user_id, email: email})
  end

  def verify_token(token) do
    case(Token.verify(Endpoint, @salt, token, max_age: @ttl)) do
      {:ok, _user_data} = response -> response
      _error -> {:error, :unauthorized}
    end
  end
end
