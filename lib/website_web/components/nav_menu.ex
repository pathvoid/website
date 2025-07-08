defmodule WebsiteWeb.NavMenu do
  use Phoenix.Component

  attr :current_path, :string, required: true

  # Navigation menu with responsive design and mobile hamburger menu
  def nav_menu(assigns) do
    ~H"""
    <nav class="w-full bg-[#141414] border-b border-gray-800">
      <div class="max-w-4xl mx-auto flex items-center justify-between px-4 py-4">
        <div class="flex-1 flex items-center">
          <!-- Desktop navigation links -->
          <div class="hidden md:flex items-center gap-8">
            <.nav_link href="/" current_path={@current_path}>Home</.nav_link>
            <.nav_link href="/philosophy" current_path={@current_path}>Digital Footprint</.nav_link>
            <.nav_link href="/projects" current_path={@current_path}>Projects</.nav_link>
          </div>
          <!-- Mobile menu toggle button -->
          <div class="md:hidden flex items-center">
            <button phx-click="toggle-menu" phx-hook="MobileNav" id="mobile-nav-btn" aria-label="Open menu" class="text-gray-400 hover:text-white focus:outline-none focus:ring-2 focus:ring-gray-600 p-2">
              <svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16" />
              </svg>
            </button>
          </div>
        </div>
      </div>
      <!-- Mobile dropdown menu -->
      <div id="mobile-nav-menu" class="md:hidden hidden px-4 pb-4">
        <div class="flex flex-col gap-2 bg-[#1a1a1a] rounded-lg p-4 border border-gray-800">
          <.nav_link href="/" current_path={@current_path}>Home</.nav_link>
          <.nav_link href="/philosophy" current_path={@current_path}>Digital Footprint</.nav_link>
          <.nav_link href="/projects" current_path={@current_path}>Projects</.nav_link>
        </div>
      </div>
      <script>
        window.addEventListener('DOMContentLoaded', function() {
          var btn = document.getElementById('mobile-nav-btn');
          var menu = document.getElementById('mobile-nav-menu');
          if (btn && menu) {
            btn.addEventListener('click', function() {
              menu.classList.toggle('hidden');
            });
          }
        });
      </script>
    </nav>
    """
  end

  # Navigation link with active state highlighting
  defp nav_link(assigns) do
    active = assigns[:href] == assigns[:current_path]
    class =
      "text-gray-400 hover:text-white transition-colors px-2 py-1 rounded " <>
        if active, do: "bg-gray-800 text-white", else: ""
    assigns = assign(assigns, :class, class)
    ~H"""
    <a href={@href} class={@class}><%= render_slot(@inner_block) %></a>
    """
  end
end
