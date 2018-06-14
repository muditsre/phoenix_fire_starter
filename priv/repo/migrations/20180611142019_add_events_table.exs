defmodule FireStarter.Repo.Migrations.AddEventsTable do
  use Ecto.Migration

  def change do
    create table(:events) do
      add :title, :string, size: 50
      add :description, :text
      timestamps
    end
  end
end
