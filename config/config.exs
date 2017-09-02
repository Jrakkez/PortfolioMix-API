# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :mixer,
  ecto_repos: [Mixer.Repo]

# Configures the endpoint
config :mixer, Mixer.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "9RVTfGXnk+My0kh6pDyvrUNCmfmVTTRmYN8Zy3di7lA4deAtbCnVvWM5oHnixiUI",
  render_errors: [view: Mixer.ErrorView, accepts: ~w(json)],
  pubsub: [name: Mixer.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Handle the mime type. https://medium.com/peep-stack/building-a-performant-web-app-with-ember-fastboot-and-phoenix-part-1-fa1241654308
config :phoenix, :format_encoders,
  "json-api": Poison

config :plug, :mimes, %{
  "application/vnd.api+json" => ["json-api"]
}

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
