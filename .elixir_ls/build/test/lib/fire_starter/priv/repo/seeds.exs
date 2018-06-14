# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FireStarter.Repo.insert!(%FireStarter.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
unless(FireStarter.EventQueries.any) do
  FireStarter.EventQueries.create(FireStarter.Events.changeset(%FireStarter.Events{}, %{title: "Fourth", description: "This is Fourth Event" }))
  FireStarter.EventQueries.create(FireStarter.Events.changeset(%FireStarter.Events{}, %{title: "Fifth", description: "This is Fifth Event" }))
end
