defmodule Nutri.Meals.Delete do
  alias Nutri.{Repo, Meal, Error}

  def call(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_not_found_meal()}
      meal -> Repo.delete(meal)
    end
  end
end
