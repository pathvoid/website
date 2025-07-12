defmodule WebsiteWeb.PageController do
  use WebsiteWeb, :controller

  # Cache TTL in seconds (5 minutes)
  @cache_ttl 300

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
    # Display privacy status with data from GitHub
    data = load_privacy_data()
    render(conn, :status, layout: false, data: data)
  end

  def considerations(conn, _params) do
    # Show privacy considerations with data from GitHub
    data = load_privacy_data()
    render(conn, :considerations, layout: false, data: data)
  end

  def philosophy(conn, _params) do
    # Display privacy philosophy page
    render(conn, :philosophy, layout: false)
  end

  def projects(conn, _params) do
    # Show projects with data from GitHub
    data = load_projects()
    render(conn, :projects, layout: false, data: data)
  end

  # Load privacy data from local files during development, GitHub in production
  defp load_privacy_data do
    if Mix.env() == :dev do
      # Load from local file during development
      load_json_from_local_file("priv/static/data/privacy_data.json")
    else
      # Load from GitHub with caching in production
      cache_key = "privacy_data"

      case get_cached_data(cache_key) do
        {:ok, data} -> data
        {:error, _reason} ->
          url = "https://raw.githubusercontent.com/pathvoid/website/main/priv/static/data/privacy_data.json"

          case fetch_json_from_github(url) do
            {:ok, data} ->
              cache_data(cache_key, data)
              data
            {:error, _reason} -> %{}
          end
      end
    end
  end

  # Load projects data from local files during development, GitHub in production
  defp load_projects do
    if Mix.env() == :dev do
      # Load from local file during development
      load_json_from_local_file("priv/static/data/projects.json")
    else
      # Load from GitHub with caching in production
      cache_key = "projects_data"

      case get_cached_data(cache_key) do
        {:ok, data} -> data
        {:error, _reason} ->
          url = "https://raw.githubusercontent.com/pathvoid/website/main/priv/static/data/projects.json"

          case fetch_json_from_github(url) do
            {:ok, data} ->
              cache_data(cache_key, data)
              data
            {:error, _reason} -> []
          end
      end
    end
  end

  # Load JSON from local file
  defp load_json_from_local_file(file_path) do
    case File.read(file_path) do
      {:ok, content} ->
        case Jason.decode(content) do
          {:ok, data} -> data
          {:error, _reason} ->
            if String.contains?(file_path, "privacy_data") do
              %{}
            else
              []
            end
        end
      {:error, _reason} ->
        if String.contains?(file_path, "privacy_data") do
          %{}
        else
          []
        end
    end
  end

  # Fetch JSON data from GitHub using raw content URLs
  defp fetch_json_from_github(url) do
    case Finch.build(:get, url) |> Finch.request(Website.Finch) do
      {:ok, %Finch.Response{status: 200, body: body}} ->
        case Jason.decode(body) do
          {:ok, data} -> {:ok, data}
          {:error, reason} -> {:error, reason}
        end
      {:ok, %Finch.Response{status: status}} ->
        {:error, "HTTP #{status}"}
      {:error, reason} ->
        {:error, reason}
    end
  end

  # Simple in-memory cache functions
  defp get_cached_data(key) do
    case Process.get({:cache, key}) do
      {data, timestamp} ->
        if System.system_time(:second) - timestamp < @cache_ttl do
          {:ok, data}
        else
          Process.delete({:cache, key})
          {:error, :expired}
        end
      nil ->
        {:error, :not_found}
    end
  end

  defp cache_data(key, data) do
    Process.put({:cache, key}, {data, System.system_time(:second)})
  end
end
