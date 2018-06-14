defmodule FireStarter.Router do
  use FireStarter.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers

  end

  # pipeline :authorized do
  #   plug :browser
  #   plug  FireStarter.AuthorizedPlug
  # end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", FireStarter do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/events/", EventController, :list
    get "/events/new", EventController, :create
    post "/events/new", EventController, :add
    get "/events/:id", EventController, :show
    get "/login", LoginController, :index
    post "/login", LoginController, :login
    post "/events/:id/reserve", EventController, :reserve
  end

  # scope "events/", FireStarter do
  #   pipe_through :authorized # Use the default authorized stack
  #   get "/", EventController, :list
  #   get "/new", EventController, :create
  #   post "/new", EventController, :add
  #   get "/:id", EventController, :show

  # end


  # Other scopes may use custom stacks.
  # scope "/api", FireStarter do
  #   pipe_through :api
  # end
end
