# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :holidays,
  ecto_repos: [Holidays.Repo]

# Configures the endpoint
config :holidays, HolidaysWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "ToOi8cC+gagWWYd1E/OOaqyLw8qjw96se6wVvl8YvYPDOiEmK2EP8cvG8dCPtfHB",
  render_errors: [view: HolidaysWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Holidays.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
