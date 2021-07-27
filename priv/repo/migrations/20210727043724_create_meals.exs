defmodule Nutri.Repo.Migrations.CreateMeals do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add :description, :string
      add :calories, :float
      add :date, :utc_datetime
    end
  end
end
