defmodule Manager.Repo.Migrations.CreateTeams do
  use Ecto.Migration

  def change do
    create table(:teams) do
      add :manager_id, references(:users, on_delete: :nothing)
      add :member_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:teams, [:manager_id])
    create index(:teams, [:member_id])
  end
end
