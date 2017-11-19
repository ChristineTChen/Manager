defmodule ManagerWeb.TeamView do
  use ManagerWeb, :view
  alias ManagerWeb.TeamView

  def render("index.json", %{teams: teams}) do
    %{data: render_many(teams, TeamView, "team.json")}
  end

  def render("show.json", %{team: team}) do
    %{data: render_one(team, TeamView, "team.json")}
  end

  def render("team.json", %{team: team}) do
    %{id: team.id}
  end

  def render("team.json", %{team: team}) do 
    data = %{
      id: team.id,
      manager_id: team.manager_id,
      member_id: team.member_id,
    }

    if Ecto.assoc_loaded?(team.manager) do 
      Map.put(data, :user_email, team.manager.email)
    else
      data
    end 
  end 

end
