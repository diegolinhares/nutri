defmodule Nutri.Users.CreateTest do
  use Nutri.DataCase, async: true

  alias Nutri.{User, Error}
  alias Nutri.Users.Create

  import Nutri.Factory

  describe "call/1" do
    test "when all params are valid, returns the meal" do
      # Arrange
      params = build(:user_params)

      # Act
      response = Create.call(params)

      # Assert
      assert {:ok, %User{}} = response
    end

    test "when there are invalid params, returns an error" do
      # Arrange
      params = build(:user_params, %{"cpf" => "0"})

      # Act
      response = Create.call(params)

      # Assert
      assert {:error, %Error{result: changeset}} = response

      expected_response = %{cpf: ["should be 11 character(s)"]}

      assert errors_on(changeset) == expected_response
    end
  end
end
