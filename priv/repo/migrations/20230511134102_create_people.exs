defmodule TestGenServer.Repo.Migrations.CreatePeople do
  use Ecto.Migration

  def change do
    create table(:people) do
      add :name, :string
      add :bio, :text

      timestamps()
    end
  end
end
