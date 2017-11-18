defmodule Manager.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :name, :string
      add :email, :string
      add :isManager?, :boolean, default: false, null: false
      add :isAdmin?, :boolean, default: false, null: false
      add :token, :string

      timestamps()
    end

  end
end
