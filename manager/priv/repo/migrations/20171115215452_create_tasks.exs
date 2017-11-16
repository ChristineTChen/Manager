defmodule Manager.Repo.Migrations.CreateTasks do
  use Ecto.Migration

  def change do
    create table(:tasks) do
      add :desc, :string
      add :manager_id, references(:users, on_delete: :nothing)
      add :assignee_id, references(:users, on_delete: :nothing)

      timestamps()
    end

    create index(:tasks, [:manager_id])
    create index(:tasks, [:assignee_id])
  end
end
