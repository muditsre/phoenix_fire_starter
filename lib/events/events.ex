defmodule FireStarter.Events do
  use Ecto.Schema
  import Ecto.Changeset

  schema "events" do
    field :title, :string
    field :description, :string
    field :quantity_available, :integer, default: 25
    timestamps()
  end

  # @required_fields  ~w(title)a
  # @optional_fields  ~w(description)a


  def changeset(event , params \\ %{}) do
    event
    |> cast(params, [:title,:description])
    |> validate_required([:title])
  end

  # def changeset1(event , params \\ %{}) do
  #     event
  #     |> cast(params, @required_fields ++ @optional_fields)
  #     |> validate_required(@required_fields)
  #     #|> validate_change(:date, &must_be_in_future/2)
  # end


  # defp must_be_in_future(_, value) do
  #   Ecto.DateTime.compare(value , Ecto.DateTime.utc)
  #   |>  get_error
  # end

  # defp get_error(comprasion) when comprasion == :lt, do: [date: "Cann't be in past"]
  # defp get_error(_), do: []

end
