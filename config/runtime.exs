import Config

# Runtime configuration for production environment
# This file is executed after compilation and before system startup

# Enable server when PHX_SERVER environment variable is set
if System.get_env("PHX_SERVER") do
  config :website, WebsiteWeb.Endpoint, server: true
end

if config_env() == :prod do
  # Secret key base for signing cookies and secrets
  secret_key_base =
    System.get_env("SECRET_KEY_BASE") ||
      raise """
      environment variable SECRET_KEY_BASE is missing.
      You can generate one by calling: mix phx.gen.secret
      """

  host = System.get_env("PHX_HOST") || "example.com"
  port = String.to_integer(System.get_env("PORT") || "4000")

  config :website, :dns_cluster_query, System.get_env("DNS_CLUSTER_QUERY")

  # Production endpoint configuration
  config :website, WebsiteWeb.Endpoint,
    url: [host: host, port: 443, scheme: "https"],
    http: [
      # Enable IPv6 and bind on all interfaces.
      # Set it to  {0, 0, 0, 0, 0, 0, 0, 1} for local network only access.
      # See the documentation on https://hexdocs.pm/bandit/Bandit.html#t:options/0
      # for details about using IPv6 vs IPv4 and loopback vs public addresses.
      ip: {0, 0, 0, 0, 0, 0, 0, 0},
      port: port
    ],
    secret_key_base: secret_key_base
end
