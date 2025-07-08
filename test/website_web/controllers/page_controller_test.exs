defmodule WebsiteWeb.PageControllerTest do
  use WebsiteWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, ~p"/")
    assert html_response(conn, 200) =~ "Hi, I'm Martin-Patrick"
  end

  test "GET /status", %{conn: conn} do
    conn = get(conn, ~p"/status")
    assert html_response(conn, 200) =~ "Status"
  end

  test "GET /considerations", %{conn: conn} do
    conn = get(conn, ~p"/considerations")
    assert html_response(conn, 200) =~ "Under Consideration"
  end

  test "GET /philosophy", %{conn: conn} do
    conn = get(conn, ~p"/philosophy")
    assert html_response(conn, 200) =~ "My Privacy Philosophy"
  end

  test "GET /projects", %{conn: conn} do
    conn = get(conn, ~p"/projects")
    assert html_response(conn, 200) =~ "My Projects"
  end
end
