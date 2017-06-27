defmodule Neplaces.VisitTest do
  use Neplaces.ModelCase

  alias Neplaces.Visit

  @valid_attrs %{date: %{day: 17, month: 4, year: 2010}, description: "some content", place: "some content", rating: 42, state: "some content", time: %{hour: 14, min: 0, sec: 0}}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Visit.changeset(%Visit{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Visit.changeset(%Visit{}, @invalid_attrs)
    refute changeset.valid?
  end
end
