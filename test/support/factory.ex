defmodule Nutri.Factory do
  use ExMachina.Ecto, repo: Nutri.Repo

  alias Nutri.{Meal, User}

  def meal_params_factory do
    user = insert(:user)

    %{
      "description" => "Arroz Branco",
      "calories" => 1000.0,
      "date" => ~U[2021-05-12 11:00:00Z],
      "user_id" => user.id
    }
  end

  def meal_factory do
    %Meal{
      id: 1,
      description: "Arroz Branco",
      calories: 1000.0,
      date: ~U[2021-05-12 11:00:00Z],
      user: build(:user)
    }
  end

  def user_factory do
    %User{
      name: "James Bot",
      email: "jamesbot@bots.com",
      cpf: "00000000000"
    }
  end

  def user_params_factory do
    %{
      "name" => "James Bot",
      "email" => "jamesbot@bots.com",
      "cpf" => "00000000000"
    }
  end
end
