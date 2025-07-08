import Config

# Static file cache manifest for production
config :website, WebsiteWeb.Endpoint, cache_static_manifest: "priv/static/cache_manifest.json"

# Swoosh API client configuration
config :swoosh, api_client: Swoosh.ApiClient.Finch, finch_name: Website.Finch

# Disable Swoosh local storage in production
config :swoosh, local: false

# Production logging configuration
config :logger, level: :info

# Runtime configuration is handled in config/runtime.exs
