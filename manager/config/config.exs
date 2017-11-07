# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :manager,
  ecto_repos: [Manager.Repo]

# Configures the endpoint
config :manager, ManagerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "DtrG4YL8VR7wlehN6JaC8yXwzajj2eTsL37/dFK4tWEshNFi9xo6V9gTfiSk2ye9",
  render_errors: [view: ManagerWeb.ErrorView, accepts: ~w(json)],
  pubsub: [name: Manager.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
