defmodule FireStarter.EventController do
  use FireStarter.Web, :controller

  plug FireStarter.AuthorizedPlug, "create" when action in [:create]


  def show(conn, %{"id"=>id}) do
    event = FireStarter.EventQueries.get_by_id(id)
    |> IO.inspect()
    render conn, "details.html", event: event
  end
  def list(conn, _params) do
    events = FireStarter.EventQueries.get_all
    render conn, "list.html", events: events
  end


  def create(conn, %{errors: errors}) do
     render conn, "create.html", changeset: errors

  end

  def create(conn, _params) do

    changeset = FireStarter.Events.changeset(%FireStarter.Events{}, %{})
    render conn, "create.html", changeset: changeset

  end

  def add(conn, %{"events"=>events}) do
    changeset = FireStarter.Events.changeset(%FireStarter.Events{}, events)
     #|> FireStarter.EventQueries.create

    case FireStarter.EventQueries.create changeset do
      {:ok , %{id: id}} ->  redirect conn, to: event_path(conn, :show, id)
      {:error , reason} -> create conn, %{errors: reason}
    end
 end


 def reserve(conn , %{"id" => id, "reservation" => %{"quantity" => quantity}} ) do
    {:ok , event} = FireStarter.EventQueries.decrease_quantity(id , quantity)
    FireStarter.EventChannel.send_update(event)
    redirect conn, to: event_path(conn, :show, id)
 end


end
