defmodule Nutri.Meals.DeleteTest do
  use Nutri.DataCase, async: true

  alias Nutri.{Meal, Error}
  alias Nutri.Meals.{Create, Delete}

  import Nutri.Factory

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      # Arrange
      {:ok, meal} =
        :meal_params
        |> build()
        |> Create.call()

      # Act
      response = Delete.call(meal.id)

      # Assert
      assert {:ok,
              %Meal{calories: 1.0e3, date: ~U[2021-05-12 11:00:00Z], description: "Arroz Branco"}} =
               response
    end

    test "when there are invalid params, returns an error" do
      # Arrange
      id = 9999

      # Act
      response = Delete.call(id)

      # Assert
      assert {:error, %Error{result: "Not found Meal!", status: :not_found}} = response
    end
  end
end
