defmodule WebsiteWeb.Gettext do
  @moduledoc """
  Internationalization module using Gettext for multi-language support.

  Provides translation functions for localizing application text.
  """

  use Gettext.Backend, otp_app: :website
end
