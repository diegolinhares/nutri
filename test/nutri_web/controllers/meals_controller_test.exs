defmodule NutriWeb.MealsControllerTest do
  use NutriWeb.ConnCase, async: true

  import Nutri.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      # Arrange
      params =
        %{
          "description" => "Arroz Branco",
          "calories" => "1000.0",
          "date" => "2021-05-12 00:00:00.000001"
        }

      # Act
      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      # Assert
      assert %{"meal" =>
                %{"calories" => 1.0e3, "date" => "2021-05-12T00:00:00Z", "description" => "Arroz Branco", "id" => _id}} = response
    end
  end
end
