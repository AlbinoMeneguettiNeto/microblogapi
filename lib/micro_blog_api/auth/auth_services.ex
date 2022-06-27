defmodule MicroBlogApi.Auth.AuthServices do
  def auth(params), do:
    MicroBlogApi.User.verify_user(%{
      "email" => String.downcase(params["email"]),
      "password" => params["password"]
    })
end
