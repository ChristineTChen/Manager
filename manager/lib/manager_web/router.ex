defmodule ManagerWeb.Router do
  use ManagerWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :assign_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/auth", ManagerWeb do
    pipe_through :browser

    get "/:provider", AuthController, :index
    get "/:provider/callback", AuthController, :callback
    delete "/logout", AuthController, :delete
  end

  defp assign_current_user(conn, _) do
  assign(conn, :current_user, get_session(conn, :current_user))
  end

  scope "/", ManagerWeb do
    pipe_through :browser # Use the default browser stack

    # google cal resource
    get "/gcal", GCalController, :index

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/api", ManagerWeb do
    pipe_through :api

    resources "/teams", TeamController, except: [:new, :edit]
    resources "/tasks", TaskController, except: [:new, :edit]


  end
end
