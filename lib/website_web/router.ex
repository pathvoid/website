defmodule WebsiteWeb.Router do
  use WebsiteWeb, :router

  # Browser pipeline - handles HTML requests with session and security
  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {WebsiteWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  # API pipeline - handles JSON requests
  pipeline :api do
    plug :accepts, ["json"]
  end

  # Main application routes
  scope "/", WebsiteWeb do
    pipe_through :browser

    get "/", PageController, :home
    get "/status", PageController, :status
    get "/considerations", PageController, :considerations
    get "/philosophy", PageController, :philosophy
    get "/privacy", PageController, :philosophy
    get "/projects", PageController, :projects
  end

  # Development-only routes for debugging and monitoring
  if Application.compile_env(:website, :dev_routes) do
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      # LiveDashboard for real-time metrics and monitoring
      live_dashboard "/dashboard", metrics: WebsiteWeb.Telemetry
      # Mailbox preview for email testing
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
