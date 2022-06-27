defmodule MicroBlogApi.Users.Services do
  def create(params), do: MicroBlogApi.User.create(params)

  def show(user_id), do: MicroBlogApi.User.get_by_id(user_id)
end
