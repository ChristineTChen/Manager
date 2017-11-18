# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Microblog.Repo.insert!(%Microblog.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Manager.Repo
alias Manager.Accounts.User
alias Manager.Accounts.Team
alias Manager.Accounts.Task

Repo.delete_all(Task)
Repo.delete_all(Team)
Repo.delete_all(User)

cc = Repo.insert!(%User{name: "Christine Test", email: "cchen7196@gmail.com", token: "KJdhlajkfhajshd", isManager?: false, isAdmin?: false})
tg = Repo.insert!(%User{name: "Taliah Test", email: "green.ta@husky.neu.edu", token: "KJdhlajkfhajshd", isManager?: true, isAdmin?: false})
cw = Repo.insert!(%User {name: "Cindy Test", email: "wu.cindy@husky.neu.edu", token: "KJdhlajkfhajshd", isManager?: false, isAdmin?: false})
rh = Repo.insert!(%User {name: "Ryan Test", email: "hughes.ry@husky.neu.edu", token: "KJdhlajkfhajshd", isManager?: false, isAdmin?: false})


Repo.insert!(%Team{manager_id: tg.id, member_id: tg.id})
Repo.insert!(%Team{manager_id: tg.id, member_id: cw.id})
Repo.insert!(%Team{manager_id: tg.id, member_id: rh.id})

Repo.insert!(%Task{assignee_id: cc.id, manager_id: tg.id, desc: "This is the first task"})
Repo.insert!(%Task{assignee_id: cc.id, manager_id: tg.id, desc: "This is the second task"})

