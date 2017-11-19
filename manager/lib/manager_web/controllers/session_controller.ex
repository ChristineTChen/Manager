defmodule ManagerWeb.SessionController do
  use ManagerWeb, :controller
  require Logger

  alias Manager.User
  alias Manager.Repo

  def login(conn, %{"email" => email}) do
    user = %{user_email: email, token: ""}

    changeset = User.changeset(%User{}, user)
    conn
    |> put_session(:current_user, user)
    |> redirect(to: "/")
    # case find_or_insert_user(changeset) do
    #   {:ok, user} ->
    #     conn
    #     |> put_session(:current_user, user)
    #     |> redirect(to: "/")
    #   {:error, _reason} ->
    #     conn
    #     |> put_flash(:error, "Error signing in")
    #     |> redirect("/")
    # end
  end

  def logout(conn, _params) do
    Logger.info("logging out")
    conn
    |> put_flash(:info, "You have been logged out!")
    |> configure_session(drop: true)
    |> redirect(to: "/")
  end


  defp find_or_insert_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
        user ->
          {:ok, user}
      end
    end
  end
