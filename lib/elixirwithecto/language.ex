defmodule Elixirwithecto.Language do
  @moduledoc """
  Language module
  """

  use Ecto.Schema
  alias Elixirwithecto.{Language, Repo}
  import Ecto.Changeset
  import Ecto.Query

  schema "language" do
    field :name, :string, null: false
    field :first_version, :integer, default: 0
    field :paradigm, :string
    field :actual_version, :string
    field :active, :boolean, default: true

    timestamps()
  end

  def list do
    Repo.all Language
  end

  def create_language(name, first_version, paradigm, actual_version) do
    %Language{name: name, first_version: first_version, paradigm: paradigm, actual_version: actual_version}
    |> Repo.insert()
  end

  def name(name) do
    Repo.get_by!(Language, name: name)
  end

  def last_added do
    Language
    |> last()
    |> Repo.one()
  end

  def total do
    Language
    query = from l in Language,
            select: count(l.id)
    Repo.one(query)
  end

  @doc """
  Return languages created after the given year

  ## Example

      iex> Elixirwithecto.Language.min_year(2000)
      ["Elixir"]

  """
  def min_year(year) do
    query = from l in Language,
            where: l.first_version > ^year,
            select: l.name
    Repo.all(query)
  end


  def changeset(language, params \\ %{}) do
    language
    |> cast(params, [:name, :first_version, :paradigm, :actual_version])
    |> validate_required([:name])
    |> validate_length(:name, min: 2)
  end
end
