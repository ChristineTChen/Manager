defmodule ManagerWeb.TeamsController do 
	use ManagerWeb, :controller 

	def index(conn, _params) do 
		render conn, "index.html"
	end
end