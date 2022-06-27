defmodule MicroBlogApi.User do
  use Ecto.Schema
  alias MicroBlogApi.{Repo, User, Post}

  import Ecto.Changeset

  @fields [:name, :age, :email, :password]

  schema "users" do
    field(:name, :string)
    field(:age, :integer)
    field(:email, :string)
    field(:password, Comeonin.Ecto.Password)

    has_many(:posts, Post)

    timestamps()
  end

  def changeset(user, params) do
    user
    |> cast(params, @fields)
    |> validate_required(@fields)
    |> validate_format(:email, ~r/@/)
    |> validate_number(:age, greater_than_or_equal_to: 18)
    |> validate_length(:name, min: 2)
    |> validate_inclusion(:age, 18..100)
    |> unique_constraint(:email)
  end

  def create(params) do
    %User{}
    |> changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, user} -> {:ok, user}
      {:error, changeset} -> {:error, changeset}
    end
  end

  def get_by_id(user_id) do
    try do
      user = Repo.get!(User, user_id)
      {:ok, user}
    rescue
      _e in Ecto.NoResultsError -> {:no_result, message: "User not found"}
    end
  end

  def verify_user(%{"password" => password} = params) do
    try do
      user = Repo.get_by!(User, [email: params["email"]])
      case Pbkdf2.verify_pass(password, user.password) do
        true -> {:ok, user}
        false -> {:unauthorized, message: "Wrong password"}
      end
    rescue
      _e in Ecto.NoResultsError -> {:no_result, message: "User not found"}
    end
  end
end
