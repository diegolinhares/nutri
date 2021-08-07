defmodule Nutri do
  alias Nutri.Meals.Create, as: MealCreate
  alias Nutri.Meals.Get, as: MealGet
  alias Nutri.Meals.Update, as: MealUpdate
  alias Nutri.Meals.Delete, as: MealDelete

  alias Nutri.Users.Create, as: UserCreate
  alias Nutri.Users.Get, as: UserGet
  alias Nutri.Users.Update, as: UserUpdate
  alias Nutri.Users.Delete, as: UserDelete

  defdelegate create_meal(params), to: MealCreate, as: :call
  defdelegate get_meal_by_id(id), to: MealGet, as: :by_id
  defdelegate update_meal(params), to: MealUpdate, as: :call
  defdelegate delete_meal(params), to: MealDelete, as: :call
  defdelegate create_user(params), to: UserCreate, as: :call
  defdelegate get_user_by_id(id), to: UserGet, as: :by_id
  defdelegate update_user(params), to: UserUpdate, as: :call
  defdelegate delete_user(params), to: UserDelete, as: :call
end
