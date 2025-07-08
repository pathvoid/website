# Privacy-Focused Personal Website

A personal website built with Phoenix Framework that showcases my journey toward digital privacy and self-hosting. This site demonstrates practical approaches to reclaiming digital autonomy without sacrificing modern conveniences.

## About

This website serves as both a portfolio and a living document of my privacy philosophy and projects. It features:

- **Privacy Philosophy**: My approach to "privacy without purism"
- **Project Showcase**: Self-hosted solutions and privacy-focused tools
- **Status Dashboard**: Real-time updates on my digital infrastructure
- **Considerations**: Challenges and trade-offs in the privacy journey

## Technology Stack

- **Backend**: Elixir/Phoenix Framework
- **Frontend**: HEEx templates with Tailwind CSS
- **Data**: JSON files for dynamic content management

## Data Management

Content is stored in JSON files (`priv/static/data/`) rather than a database for several reasons:

- **Simplicity**: No database setup or maintenance required
- **Version Control**: Content changes are tracked alongside code changes
- **Portability**: Easy to backup, migrate, or deploy to different environments
- **Privacy**: No external database dependencies or data collection
- **Performance**: Fast file-based access without database queries
- **Transparency**: Content is visible and editable in plain text format

This approach aligns with the project's philosophy of self-hosting and reducing external dependencies while maintaining flexibility for content updates.

## Development

To start the Phoenix server:

1. Install dependencies: `mix setup`
2. Start the server: `mix phx.server` or `iex -S mix phx.server`
3. Visit [`localhost:4000`](http://localhost:4000) in your browser

## Project Structure

- `lib/website_web/controllers/page_controller.ex` - Main page controllers
- `lib/website_web/controllers/page_html/` - Page templates
- `lib/website_web/components/` - Reusable UI components
- `priv/static/data/` - JSON data files for dynamic content

## Philosophy

This project embodies the principle that privacy should be the default, not a special request. It demonstrates practical ways to reduce digital surveillance while maintaining functionality and usability.

## License

This project is open source and available under the [MIT License](LICENSE).
