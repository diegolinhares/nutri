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
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_number(:calories, greater_than: 0)
  end
end
