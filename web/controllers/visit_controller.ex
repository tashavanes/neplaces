defmodule Neplaces.VisitController do
  use Neplaces.Web, :controller

  alias Neplaces.Visit

  def index(conn, _params) do
    visits = Repo.all(Visit)
    render(conn, "index.html", visits: visits)
  end

  def new(conn, _params) do
    changeset = Visit.changeset(%Visit{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"visit" => visit_params}) do
    changeset = Visit.changeset(%Visit{}, visit_params)

    case Repo.insert(changeset) do
      {:ok, _visit} ->
        conn
        |> put_flash(:info, "Visit created successfully.")
        |> redirect(to: visit_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    visit = Repo.get!(Visit, id)
    render(conn, "show.html", visit: visit)
  end

  def edit(conn, %{"id" => id}) do
    visit = Repo.get!(Visit, id)
    changeset = Visit.changeset(visit)
    render(conn, "edit.html", visit: visit, changeset: changeset)
  end

  def update(conn, %{"id" => id, "visit" => visit_params}) do
    visit = Repo.get!(Visit, id)
    changeset = Visit.changeset(visit, visit_params)

    case Repo.update(changeset) do
      {:ok, visit} ->
        conn
        |> put_flash(:info, "Visit updated successfully.")
        |> redirect(to: visit_path(conn, :show, visit))
      {:error, changeset} ->
        render(conn, "edit.html", visit: visit, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    visit = Repo.get!(Visit, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(visit)

    conn
    |> put_flash(:info, "Visit deleted successfully.")
    |> redirect(to: visit_path(conn, :index))
  end
end
