defmodule TestGenServer.PeopleFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TestGenServer.People` context.
  """

  @doc """
  Generate a person.
  """
  def person_fixture(attrs \\ %{}) do
    {:ok, person} =
      attrs
      |> Enum.into(%{
        bio: "some bio",
        name: "some name"
      })
      |> TestGenServer.People.create_person()

    person
  end
end
