defmodule Nutri.Meals.Get do
  alias Nutri.{Repo, Meal, Error}

  def by_id(id) do
    case Repo.get(Meal, id) do
      nil -> {:error, Error.build_not_found_meal()}
      meal -> {:ok, meal}
    end
  end
end
