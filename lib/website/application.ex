defmodule Website.Application do
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Telemetry for metrics and monitoring
      WebsiteWeb.Telemetry,
      # DNS clustering for load balancing
      {DNSCluster, query: Application.get_env(:website, :dns_cluster_query) || :ignore},
      # PubSub for real-time communication
      {Phoenix.PubSub, name: Website.PubSub},
      # HTTP client for external API calls and email sending
      {Finch, name: Website.Finch},
      # Web server endpoint - serves HTTP requests
      WebsiteWeb.Endpoint
    ]

    # Start all child processes with one-for-one restart strategy
    opts = [strategy: :one_for_one, name: Website.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    # Update endpoint configuration when application config changes
    WebsiteWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
