defmodule Nutri.Factory do
  use ExMachina

  def meal_params_factory do
    %{
      description: "Arroz Branco",
      calories: 1000.0,
      date: ~U[2021-05-12 11:00:00Z]
    }
  end
end
