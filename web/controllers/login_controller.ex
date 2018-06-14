defmodule FireStarter.LoginController do
  use FireStarter.Web, :controller

  def index(conn, _) do
    render conn, "login.html"
  end

  def login(conn , %{"login" => %{"username" => name}}) do

    expration = 60*60*24*7
    conn
    |> Plug.Conn.put_resp_cookie("user_name", name, max_age: expration )
    |> redirect(to: "/")

  end
end
