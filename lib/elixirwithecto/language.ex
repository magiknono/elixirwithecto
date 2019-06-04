defmodule Elixirwithecto.Language do
  use Ecto.Schema
  alias Elixirwithecto.{Language, Repo}
  import Ecto.Changeset

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

  def changeset(language, params \\ %{}) do
    language
    |> cast(params, [:name, :first_version, :paradigm, :actual_version])
    |> validate_required([:name])
    |> validate_length(:name, min: 2)
  end
end
