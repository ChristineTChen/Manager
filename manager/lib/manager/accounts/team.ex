defmodule Manager.Accounts.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.Accounts.Team


  schema "teams" do
    field :manager_id, :id
    field :member_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Team{} = team, attrs) do
    team
    |> cast(attrs, [])
    |> validate_required([])
  end
end
