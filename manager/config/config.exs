# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

config :manager, Manager.Repo,
  adapter: Ecto.Adapters.Postgres,
  database: "manager_repo",
  username: "postgres",
  password: "postgres",
  hostname: "localhost"

config :manager,
  ecto_repos: [Manager.Repo]

# Configures the endpoint
config :manager, ManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "vInaAxJowJjHCTiemb1wuRHsHXdE4gIrbBMftDu3qNqkcl8stUwIOQZlYu40SKqK",
  render_errors: [view: ManagerWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Manager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"


