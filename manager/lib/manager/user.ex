defmodule Manager.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.User


  schema "users" do
    field :email, :string
    field :isAdmin?, :boolean, default: false
    field :isManager?, :boolean, default: false
    field :name, :string
    field :token, :string

    timestamps()
  end

  @doc false
  def changeset(%User{} = user, attrs) do
    user
    |> cast(attrs, [:name, :email, :token, :isManager?, :isAdmin?])
    |> validate_required([:name, :email, :token, :isManager?, :isAdmin?])
  end
end
