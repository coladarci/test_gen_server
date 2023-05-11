defmodule TestGenServer.People.Person do
  use Ecto.Schema
  import Ecto.Changeset

  schema "people" do
    field :bio, :string
    field :name, :string

    timestamps()
  end

  @doc false
  def changeset(person, attrs) do
    person
    |> cast(attrs, [:name, :bio])
    |> validate_required([:name, :bio])
  end
end
