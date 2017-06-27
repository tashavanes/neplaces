defmodule Neplaces.VisitControllerTest do
  use Neplaces.ConnCase

  alias Neplaces.Visit
  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, description: "some content", place: "some content", rating: 42, state: "some content", time: %{hour: 14, min: 0, sec: 0}}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, visit_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing visits"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, visit_path(conn, :new)
    assert html_response(conn, 200) =~ "New visit"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, visit_path(conn, :create), visit: @valid_attrs
    assert redirected_to(conn) == visit_path(conn, :index)
    assert Repo.get_by(Visit, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, visit_path(conn, :create), visit: @invalid_attrs
    assert html_response(conn, 200) =~ "New visit"
  end

  test "shows chosen resource", %{conn: conn} do
    visit = Repo.insert! %Visit{}
    conn = get conn, visit_path(conn, :show, visit)
    assert html_response(conn, 200) =~ "Show visit"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, visit_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    visit = Repo.insert! %Visit{}
    conn = get conn, visit_path(conn, :edit, visit)
    assert html_response(conn, 200) =~ "Edit visit"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    visit = Repo.insert! %Visit{}
    conn = put conn, visit_path(conn, :update, visit), visit: @valid_attrs
    assert redirected_to(conn) == visit_path(conn, :show, visit)
    assert Repo.get_by(Visit, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    visit = Repo.insert! %Visit{}
    conn = put conn, visit_path(conn, :update, visit), visit: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit visit"
  end

  test "deletes chosen resource", %{conn: conn} do
    visit = Repo.insert! %Visit{}
    conn = delete conn, visit_path(conn, :delete, visit)
    assert redirected_to(conn) == visit_path(conn, :index)
    refute Repo.get(Visit, visit.id)
  end
end
