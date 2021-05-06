# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :password,
  ecto_repos: [Password.Repo]

# Configures the endpoint
config :password, PasswordWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "si1rQy9wQSrIwFEjUZICQ+so7xLKTNnp8fOQ+a1YbRzaoG8gKniVLIb+DjgosIuU",
  render_errors: [view: PasswordWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: Password.PubSub,
  live_view: [signing_salt: "3nFuePbj"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
