defmodule MicroBlogApi.Post do
  use Ecto.Schema
  alias MicroBlogApi.{User, Post, Repo}

  import Ecto.Changeset

  @fields [:post, :likes, :user_id]

  schema "posts" do
    field(:post, :string)
    field(:likes, :integer)

    belongs_to(:user, User)

    timestamps()
  end

  def changeset(post, params) do
    post
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_number(:likes, greater_than_or_equal_to: 0)
    |> validate_length(:post, min: 1)
    |> validate_length(:post, max: 140)
  end

  def create(params) do
    %Post{}
    |> changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, post} -> {:ok, post}
      {:error, changeset} -> {:error, changeset}
    end
  end
end
