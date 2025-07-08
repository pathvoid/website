defmodule WebsiteWeb.PageController do
  use WebsiteWeb, :controller

  def home(conn, _params) do
    # Random privacy statement for dynamic homepage content
    privacy_statements = [
      "I'm reclaiming my digital life and making data privacy my top priority.",
      "I'm taking control of my digital world—self-hosting, degoogling, and prioritizing privacy.",
      "I'm transforming my digital footprint by self-hosting, degoogling, and putting privacy first.",
      "I'm building a private, self-hosted digital life—beyond degoogling.",
      "I'm on a journey to digital independence, replacing big tech with privacy-first solutions."
    ]
    privacy_statement = Enum.random(privacy_statements)
    render(conn, :home, layout: false, privacy_statement: privacy_statement)
  end

  def status(conn, _params) do
    # Display privacy status with data from JSON file
    data = load_privacy_data()
    render(conn, :status, layout: false, data: data)
  end

  def considerations(conn, _params) do
    # Show privacy considerations with data from JSON file
    data = load_privacy_data()
    render(conn, :considerations, layout: false, data: data)
  end

  def philosophy(conn, _params) do
    # Display privacy philosophy page
    render(conn, :philosophy, layout: false)
  end

  def projects(conn, _params) do
    # Show projects with data from JSON file
    projects = load_projects()
    render(conn, :projects, layout: false, projects: projects)
  end

  # Load privacy data from JSON file in priv/static/data/
  defp load_privacy_data do
    json_path = Path.join([:code.priv_dir(:website), "static", "data", "privacy_data.json"])

    case File.read(json_path) do
      {:ok, content} ->
        case Jason.decode(content) do
          {:ok, data} -> data
          {:error, _reason} -> %{}
        end
      {:error, _reason} -> %{}
    end
  end

  # Load projects data from JSON file in priv/static/data/
  defp load_projects do
    json_path = Path.join([:code.priv_dir(:website), "static", "data", "projects.json"])
    case File.read(json_path) do
      {:ok, content} ->
        case Jason.decode(content) do
          {:ok, data} -> data
          {:error, _} -> []
        end
      {:error, _} -> []
    end
  end
end
