defmodule FireStarter.Repo.Migrations.AddQuantitysTable do
  use Ecto.Migration

  def change do
    create table(:quantitys) do
      add :title, :string, size: 50
      timestamps
  end
end
