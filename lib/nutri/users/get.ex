defmodule Nutri.Users.Get do
  alias Nutri.{Repo, User, Error}

  def by_id(id) do
    case Repo.get(User, id) do
      nil -> {:error, Error.build_not_found_user()}
      user -> {:ok, user}
    end
  end
end
