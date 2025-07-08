import Config

# Development endpoint configuration
config :website, WebsiteWeb.Endpoint,
  # Binding to loopback ipv4 address prevents access from other machines.
  # Change to `ip: {0, 0, 0, 0}` to allow access from other machines.
  http: [ip: {127, 0, 0, 1}, port: 4000],
  check_origin: false,
  code_reloader: true,
  debug_errors: true,
  secret_key_base: "myGy04Ho54/pEdo+AR6UW0hVWYtGlcRA7yHIrVpGYu/HdgJ0mt5J5wwrKZjuQw7u",
  watchers: [
    esbuild: {Esbuild, :install_and_run, [:website, ~w(--sourcemap=inline --watch)]},
    tailwind: {Tailwind, :install_and_run, [:website, ~w(--watch)]}
  ]

# Live reload configuration for development
config :website, WebsiteWeb.Endpoint,
  live_reload: [
    patterns: [
      ~r"priv/static/(?!uploads/).*(js|css|png|jpeg|jpg|gif|svg)$",
      ~r"priv/gettext/.*(po)$",
      ~r"lib/website_web/(controllers|live|components)/.*(ex|heex)$"
    ]
  ]

# Development routes for dashboard and mailbox
config :website, dev_routes: true

# Development logging configuration
config :logger, :console, format: "[$level] $message\n"

# Development stacktrace configuration
config :phoenix, :stacktrace_depth, 20

# Runtime plug initialization for faster development
config :phoenix, :plug_init_mode, :runtime

# LiveView development configuration
config :phoenix_live_view,
  # Include HEEx debug annotations as HTML comments in rendered markup
  debug_heex_annotations: true,
  # Enable helpful, but potentially expensive runtime checks
  enable_expensive_runtime_checks: true

# Disable Swoosh API client for development
config :swoosh, :api_client, false
