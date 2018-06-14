defmodule FireStarter.Comment do
  use Ecto.Schema

  schema "comments" do
    field :title, :string
    belongs_to :events, FireStarter.Events
    timestamps()
  end

end
