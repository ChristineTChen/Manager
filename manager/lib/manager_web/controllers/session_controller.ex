defmodule ManagerWeb.SessionController do
  use ManagerWeb, :controller
  require Logger

  alias Manager.User
  alias Manager.Repo

  def login(conn, %{"name" => name, "email" => email}) do
    user = %{name: name, email: email}
    
    conn
    |> put_session(:current_user, user)
  end

  def logout(conn, _params) do
    Logger.info("logging out")
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end
end
