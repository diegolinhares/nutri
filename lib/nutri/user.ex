defmodule Nutri.User do
  use Ecto.Schema
  import Ecto.Changeset

  @required_fields [:name, :email, :cpf]

  @derive {Jason.Encoder, only: [:id] ++ @required_fields}

  schema "users" do
    field :name, :string
    field :email, :string
    field :cpf, :string

    has_many :meals, Nutri.Meal
  end

  def changeset(params) do
    %__MODULE__{}
    |> changes(params)
  end

  def update_changeset(user, params) do
    user
    |> changes(params)
  end

  defp changes(user, params) do
    user
    |> cast(params, @required_fields)
    |> validate_required(@required_fields)
    |> validate_length(:cpf, is: 11)
    |> validate_format(:email, ~r/@/)
    |> unique_constraint(:email)
    |> unique_constraint(:cpf)
  end
end
