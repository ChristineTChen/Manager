defmodule Manager.Accounts.Task do
  use Ecto.Schema
  import Ecto.Changeset
  alias Manager.Accounts.Task


  schema "tasks" do
    field :desc, :string
    field :manager_id, :id
    field :assignee_id, :id

    timestamps()
  end

  @doc false
  def changeset(%Task{} = task, attrs) do
    task
    |> cast(attrs, [:desc])
    |> validate_required([:desc])
  end
end
