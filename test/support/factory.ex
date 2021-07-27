defmodule Nutri.Factory do
  use ExMachina.Ecto, repo: Nutri.Repo

  alias Nutri.Meal

  def meal_params_factory do
    %{
      "description" => "Arroz Branco",
      "calories" => 1000.0,
      "date" => ~U[2021-05-12 11:00:00Z]
    }
  end

  @spec meal_factory :: Nutri.Meal.t()
  def meal_factory do
    %Meal{
      id: 1,
      description: "Arroz Branco",
      calories: 1000.0,
      date: ~U[2021-05-12 11:00:00Z]
    }
  end
end
