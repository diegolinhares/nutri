defmodule Nutri.Meals.Update do
  alias Nutri.{Repo, Meal, Error}

  def call(%{"id" => id} = params) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_not_found_meal()}
      meal -> update(meal, params)
    end
  end

  defp update(meal, params) do
    meal
    |> Meal.update_changeset(params)
    |> Repo.update()
  end
end
