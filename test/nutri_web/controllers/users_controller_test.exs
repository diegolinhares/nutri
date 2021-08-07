defmodule NutriWeb.UsersControllerTest do
  use NutriWeb.ConnCase, async: true

  alias Nutri.Meal

  import Nutri.Factory

  describe "create/2" do
    test "when all params are valid, creates the user", %{conn: conn} do
      # Arrange
      params = build(:user_params)

      # Act
      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:created)

      # Assert
      assert %{
               "message" => "User was created!",
               "user" => %{
                 "cpf" => "00000000000",
                 "email" => "jamesbot@bots.com",
                 "id" => _id,
                 "name" => "James Bot"
               }
             } = response
    end

    test "when params are invalid, returns an error", %{conn: conn} do
      # Arrange
      params = %{}

      # Act
      response =
        conn
        |> post(Routes.users_path(conn, :create, params))
        |> json_response(:bad_request)

      # Assert
      assert %{
               "message" => %{
                 "cpf" => ["can't be blank"],
                 "email" => ["can't be blank"],
                 "name" => ["can't be blank"]
               }
             } = response
    end
  end
end
