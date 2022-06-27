defmodule MicroBlogApi.Repo do
  use Ecto.Repo,
    otp_app: :micro_blog_api,
    adapter: Ecto.Adapters.Postgres
end
