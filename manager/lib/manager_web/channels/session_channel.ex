defmodule ManagerWeb.SessionChannel do
  use ManagerWeb, :channel
  require Logger

  alias Manager.User
  alias Manager.Repo
  alias ManagerWeb.SessionController

  def join("session:lobby", payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("sign_user", user, socket) do
    user = %{name: user["name"], email: user["email"]}
    Logger.info "#{inspect user}"
    changeset = User.changeset(%User{}, user)
    case find_or_insert_user(changeset) do
      {:ok, user} ->
        Repo.insert!(user)
        {:noreply, socket}
    end
  end

  defp find_or_insert_user(changeset) do
    case Repo.get_by(User, email: changeset.changes.email) do
      nil ->
        Repo.insert(changeset)
      user ->
        {:ok, user}
    end
  end
  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (session:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
