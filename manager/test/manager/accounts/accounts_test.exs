defmodule Manager.AccountsTest do
  use Manager.DataCase

  alias Manager.Accounts

  describe "teams" do
    alias Manager.Accounts.Team

    @valid_attrs %{}
    @update_attrs %{}
    @invalid_attrs %{}

    def team_fixture(attrs \\ %{}) do
      {:ok, team} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_team()

      team
    end

    test "list_teams/0 returns all teams" do
      team = team_fixture()
      assert Accounts.list_teams() == [team]
    end

    test "get_team!/1 returns the team with given id" do
      team = team_fixture()
      assert Accounts.get_team!(team.id) == team
    end

    test "create_team/1 with valid data creates a team" do
      assert {:ok, %Team{} = team} = Accounts.create_team(@valid_attrs)
    end

    test "create_team/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_team(@invalid_attrs)
    end

    test "update_team/2 with valid data updates the team" do
      team = team_fixture()
      assert {:ok, team} = Accounts.update_team(team, @update_attrs)
      assert %Team{} = team
    end

    test "update_team/2 with invalid data returns error changeset" do
      team = team_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_team(team, @invalid_attrs)
      assert team == Accounts.get_team!(team.id)
    end

    test "delete_team/1 deletes the team" do
      team = team_fixture()
      assert {:ok, %Team{}} = Accounts.delete_team(team)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_team!(team.id) end
    end

    test "change_team/1 returns a team changeset" do
      team = team_fixture()
      assert %Ecto.Changeset{} = Accounts.change_team(team)
    end
  end

  describe "tasks" do
    alias Manager.Accounts.Task

    @valid_attrs %{desc: "some desc"}
    @update_attrs %{desc: "some updated desc"}
    @invalid_attrs %{desc: nil}

    def task_fixture(attrs \\ %{}) do
      {:ok, task} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_task()

      task
    end

    test "list_tasks/0 returns all tasks" do
      task = task_fixture()
      assert Accounts.list_tasks() == [task]
    end

    test "get_task!/1 returns the task with given id" do
      task = task_fixture()
      assert Accounts.get_task!(task.id) == task
    end

    test "create_task/1 with valid data creates a task" do
      assert {:ok, %Task{} = task} = Accounts.create_task(@valid_attrs)
      assert task.desc == "some desc"
    end

    test "create_task/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_task(@invalid_attrs)
    end

    test "update_task/2 with valid data updates the task" do
      task = task_fixture()
      assert {:ok, task} = Accounts.update_task(task, @update_attrs)
      assert %Task{} = task
      assert task.desc == "some updated desc"
    end

    test "update_task/2 with invalid data returns error changeset" do
      task = task_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_task(task, @invalid_attrs)
      assert task == Accounts.get_task!(task.id)
    end

    test "delete_task/1 deletes the task" do
      task = task_fixture()
      assert {:ok, %Task{}} = Accounts.delete_task(task)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_task!(task.id) end
    end

    test "change_task/1 returns a task changeset" do
      task = task_fixture()
      assert %Ecto.Changeset{} = Accounts.change_task(task)
    end
  end

  describe "users" do
    alias Manager.Accounts.User

    @valid_attrs %{email: "some email", isAdmin?: true, isManager?: true, name: "some name", token: "some token"}
    @update_attrs %{email: "some updated email", isAdmin?: false, isManager?: false, name: "some updated name", token: "some updated token"}
    @invalid_attrs %{email: nil, isAdmin?: nil, isManager?: nil, name: nil, token: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.isAdmin? == true
      assert user.isManager? == true
      assert user.name == "some name"
      assert user.token == "some token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.email == "some updated email"
      assert user.isAdmin? == false
      assert user.isManager? == false
      assert user.name == "some updated name"
      assert user.token == "some updated token"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
