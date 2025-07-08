defmodule WebsiteWeb.ErrorHTML do
  @moduledoc """
  Handles HTML error page rendering for the application.
  """

  use WebsiteWeb, :html

  # Renders plain text error messages based on template names
  # Custom error pages can be added by uncommenting embed_templates/1
  # and creating templates in lib/website_web/controllers/error_html/
  def render(template, _assigns) do
    Phoenix.Controller.status_message_from_template(template)
  end
end
