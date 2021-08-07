defmodule Nutri.Error do
  @keys [:status, :result]

  @enforce_keys @keys

  defstruct @keys

  def build(status, result) do
    %__MODULE__{
      status: status,
      result: result
    }
  end

  def build_not_found_meal do
    build(:not_found, "Not found Meal!")
  end

  def build_not_found_user do
    build(:not_found, "Not found User!")
  end
end
