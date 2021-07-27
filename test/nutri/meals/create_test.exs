defmodule Nutri.Meals.CreateTest do
  use Nutri.DataCase, async: true

  alias Nutri.{Meal, Error}
  alias Nutri.Meals.Create

  import Nutri.Factory

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      # Arrange
      params = build(:meal_params)

      # Act
      response = Create.call(params)

      # Assert
      assert {:ok, %Meal{calories: 1.0e3, date: ~U[2021-05-12 11:00:00Z], description: "Arroz Branco"}} = response
    end

    test "when there are invalid params, returns an error" do
      # Arrange
      params = build(:meal_params, %{calories: 0})

      # Act
      response = Create.call(params)

      # Assert
      assert {:error, %Error{result: changeset}} = response

      expected_response = %{calories: ["must be greater than 0"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
