defmodule Nutri.Meals.Create do
  alias Nutri.{Repo, Meal, Error}

  def call(params) do
    params
    |> Meal.changeset()
    |> Repo.insert()
    |> handle_insert()
  end

  defp handle_insert({:ok, %Meal{}} = meal), do: meal

  defp handle_insert({:error, result}) do
    {:error, Error.build(:bad_request, result)}
  end
end
