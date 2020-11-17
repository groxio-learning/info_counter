# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :info_counter,
  ecto_repos: [InfoCounter.Repo]

# Configures the endpoint
config :info_counter, InfoCounterWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "7F8sL5ILssC3GXj0MC6KvBqd/2cT7RiE5EJbo/QjR/JoNH5xEkwGIqgU8FLGIBW6",
  render_errors: [view: InfoCounterWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: InfoCounter.PubSub,
  live_view: [signing_salt: "Y6A6JkBi"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
