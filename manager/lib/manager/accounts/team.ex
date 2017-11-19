defmodule Manager.Accounts.Team do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.Accounts.Team


  schema "teams" do

    belongs_to :manager_user, Manager.Accounts.User
    belongs_to :member_user, Manager.Accounts.User

    timestamps()
  end

  @doc false
  def changeset(%Team{} = team, attrs) do
    team
    |> cast(attrs, [:manager_id, :member_id])
    |> validate_required([:manager_id, :member_id])
  end
end
