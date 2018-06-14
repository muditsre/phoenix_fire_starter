defmodule FireStarter.Repo.Migrations.AddCommentsTable do
  use Ecto.Migration

  def change do
    create table(:comments) do
      add :title, :string, size: 50
      add :event_id, references(:events, on_delete: :delete_all)
      timestamps
    end
  end
end
