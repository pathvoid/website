# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

import Config

# General application configuration
config :website,
  generators: [timestamp_type: :utc_datetime]

# Endpoint configuration
config :website, WebsiteWeb.Endpoint,
  url: [host: "localhost"],
  adapter: Bandit.PhoenixAdapter,
  render_errors: [
    formats: [html: WebsiteWeb.ErrorHTML, json: WebsiteWeb.ErrorJSON],
    layout: false
  ],
  pubsub_server: Website.PubSub,
  live_view: [signing_salt: "EmOkho5X"]

# Mailer configuration
config :website, Website.Mailer, adapter: Swoosh.Adapters.Local

# Asset build configuration
config :esbuild,
  version: "0.17.11",
  website: [
    args:
      ~w(js/app.js --bundle --target=es2017 --outdir=../priv/static/assets --external:/fonts/* --external:/images/*),
    cd: Path.expand("../assets", __DIR__),
    env: %{"NODE_PATH" => Path.expand("../deps", __DIR__)}
  ]

# Configure tailwind (the version is required)
config :tailwind,
  version: "3.4.3",
  website: [
    args: ~w(
      --config=tailwind.config.js
      --input=css/app.css
      --output=../priv/static/assets/app.css
    ),
    cd: Path.expand("../assets", __DIR__)
  ]

# Logger configuration
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# JSON parsing configuration
config :phoenix, :json_library, Jason

# Import environment specific config
import_config "#{config_env()}.exs"

config :website, :env, config_env()
