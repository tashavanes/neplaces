defmodule Neplaces.Repo.Migrations.CreateVisit do
  use Ecto.Migration

  def change do
    create table(:visits) do
      add :date, :date
      add :time, :time
      add :place, :string
      add :state, :string
      add :description, :text
      add :rating, :integer

      timestamps()
    end

  end
end
