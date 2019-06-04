defmodule Elixirwithecto.Language do
  use Ecto.Schema
  alias Elixirwithecto.Repo
  alias Elixirwithecto.Language

  schema "language" do
    field :name, :string, null: false
    field :first_version, :integer, default: 0
    field :paradigm, :string
    field :actual_version, :string
    field :active, :boolean, default: true

    timestamps()
  end

  def languages do
    Repo.all Language
  end

  def create_language(name, first_version, paradigm, actual_version) do
    %Language{name: name, first_version: first_version, paradigm: paradigm, actual_version: actual_version}
    |> Repo.insert()
  end
end
