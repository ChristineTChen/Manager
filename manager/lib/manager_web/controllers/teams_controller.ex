defmodule ManagerWeb.TeamsController do 
	use ManagerWeb, :controller 

	alias Manager.Accounts.User
	alias Manager.Accounts

	def index(conn, _params) do 
		users = Accounts.list_users()
		current_user = conn.assigns[:current_user]
		if current_user do 
			render(conn, "index.html", users: users)
		else
			conn
			|> redirect(to: "/")
			|> halt()
		end
	end
end