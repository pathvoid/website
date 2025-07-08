import Config

# Test endpoint configuration
config :website, WebsiteWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "O02F5JgVKrM/7ABkIsoFQkoq7U90SUBQ/5RjMXxJupEOE36Xy/unv+EIC5iG/KWx",
  server: false

# Test mailer configuration
config :website, Website.Mailer, adapter: Swoosh.Adapters.Test

# Disable Swoosh API client for tests
config :swoosh, :api_client, false

# Test logging configuration
config :logger, level: :warning

# Runtime plug initialization for faster tests
config :phoenix, :plug_init_mode, :runtime

# LiveView test configuration
config :phoenix_live_view,
  enable_expensive_runtime_checks: true
