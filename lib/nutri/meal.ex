defmodule Nutri.Meal do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:description, :calories, :date]

  @derive {Jason.Encoder, only: [:id] ++ @required_fields}

  schema "meals" do
    field :description, :string
    field :calories, :float
    field :date, :utc_datetime
  end

  def changeset(params) do
    %__MODULE__{}
    |> changes(params)
  end

  def update_changeset(meal, params) do
    meal
    |> changes(params)
  end

  defp changes(meal, params) do
    meal
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_number(:calories, greater_than: 0)
  end
end
