defmodule MicroBlogApiWeb.UsersView do
  use MicroBlogApiWeb, :view

  def render("user.json", %{user: user}) do
    %{
      user: %{
        id: user.id,
        name: user.name,
        age: user.age,
        email: user.email
      }
    }
  end
end
