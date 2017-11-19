defmodule ManagerWeb.TaskView do
  use ManagerWeb, :view
  alias ManagerWeb.TaskView

  def render("index.json", %{tasks: tasks}) do
    %{data: render_many(tasks, TaskView, "task.json")}
  end

  def render("show.json", %{task: task}) do
    %{data: render_one(task, TaskView, "task.json")}
  end

  def render("task.json", %{tasks: task}) do 
    data = %{
      id: task.id,
      manager_id: task.manager_id,
      assignee_id: task.assignee_id,
    }
  end

  def render("task.json", %{task: task}) do
    %{id: task.id,
      desc: task.desc}
  end
end
