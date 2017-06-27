defmodule Neplaces.Visit do
  use Neplaces.Web, :model

  schema "visits" do
    field :date, Ecto.Date
    field :time, Ecto.Time
    field :place, :string
    field :state, :string
    field :description, :string
    field :rating, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date, :time, :place, :state, :description, :rating])
    |> validate_required([:date, :time, :place, :state, :description, :rating])
  end
end
