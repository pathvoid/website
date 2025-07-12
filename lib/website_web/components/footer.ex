defmodule WebsiteWeb.Footer do
  use Phoenix.Component

  # Footer component for all pages except home
  def footer(assigns) do
    ~H"""
    <footer class="w-full bg-[#141414] border-t border-gray-800 mt-auto">
      <div class="max-w-4xl mx-auto px-6 py-8">
        <div class="flex flex-col md:flex-row items-center justify-between gap-4">
          <!-- Copyright and links -->
          <div class="flex flex-col md:flex-row items-center gap-4 text-gray-400 text-sm">
            <span>&copy; <%= Date.utc_today().year %> Martin-Patrick</span>
            <div class="flex items-center gap-4">
              <a href="https://github.com/pathvoid" target="_blank" class="hover:text-white transition-colors">
                GitHub
              </a>
              <a href="/status" class="hover:text-white transition-colors">
                Privacy Status
              </a>
            </div>
          </div>
          <!-- Privacy philosophy link -->
          <div class="text-gray-500 text-xs">
            <a href="/philosophy" class="hover:text-gray-400 transition-colors">
              Privacy without purism
            </a>
          </div>
        </div>
      </div>
    </footer>
    """
  end
end
