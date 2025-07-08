defmodule WebsiteWeb.PageHTML do
  @moduledoc """
  HTML templates and helpers for page rendering.
  """

  use WebsiteWeb, :html
  import WebsiteWeb.NavMenu

  embed_templates "page_html/*"

  # Maps status colors to Tailwind CSS classes for consistent styling
  def get_status_color_class(status_color) do
    case status_color do
      "green" -> "bg-green-900 text-green-300"
      "yellow" -> "bg-yellow-400 text-yellow-900"
      "purple" -> "bg-purple-900 text-purple-200"
      "blue" -> "bg-blue-900 text-blue-200"
      _ -> "bg-gray-900 text-gray-200"
    end
  end
end
