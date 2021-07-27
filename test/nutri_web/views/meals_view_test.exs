defmodule NutriWeb.MealsViewTest do
  use NutriWeb.ConnCase, async: true

  import Phoenix.View
  import Nutri.Factory

  alias NutriWeb.MealsView

  test "renders create.json" do
    meal = build(:meal)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Nutri.Meal{
               calories: 1.0e3,
               date: ~U[2021-05-12 11:00:00Z],
               description: "Arroz Branco",
               id: 1
             }
           } = response
  end
end
