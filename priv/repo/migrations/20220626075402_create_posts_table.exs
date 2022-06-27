defmodule MicroBlogApi.Repo.Migrations.CreatePostsTable do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add(:post, :string)
      add(:likes, :integer)
      add(:user_id, references(:users))

      timestamps()
    end
  end
end
