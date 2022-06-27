defmodule MicroBlogApiWeb.AuthView do
  use MicroBlogApiWeb, :view

  def render("login.json", %{user: user, token: token}) do
    %{
      user: %{
        id: user.id,
        name: user.name,
        age: user.age,
        email: user.email
      },
      token: token
    }
  end
end
