defmodule WebsiteWeb.ErrorJSON do
  @moduledoc """
  Handles JSON error responses for the application.
  """

  # Renders JSON error responses with status messages
  # Custom error responses can be added by defining specific render functions
  def render(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end
end
