defmodule WebsiteWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :website

  # Session configuration for secure cookie storage
  @session_options [
    store: :cookie,
    key: "_website_key",
    signing_salt: "7/mGAFzO",
    same_site: "Lax"
  ]

  # WebSocket and longpoll connections for real-time features
  socket "/live", Phoenix.LiveView.Socket,
    websocket: [connect_info: [session: @session_options]],
    longpoll: [connect_info: [session: @session_options]]

  # Static file serving from priv/static directory
  plug Plug.Static,
    at: "/",
    from: :website,
    gzip: false,
    only: WebsiteWeb.static_paths()

  # Development-only code reloading
  if code_reloading? do
    socket "/phoenix/live_reload/socket", Phoenix.LiveReloader.Socket
    plug Phoenix.LiveReloader
    plug Phoenix.CodeReloader
  end

  # Request logging and telemetry
  plug Phoenix.LiveDashboard.RequestLogger,
    param_key: "request_logger",
    cookie_key: "request_logger"

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  # Request parsing for various content types
  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  # Standard HTTP method handling
  plug Plug.MethodOverride
  plug Plug.Head
  plug Plug.Session, @session_options
  plug WebsiteWeb.Router
end
