defmodule Elixirwithecto.Language do
  use Ecto.Schema

  schema "language" do
    field :name, :string, null: false
    field :first_version, :integer, default: 0
    field :paradigm, :string
    field :actual_version, :float
    field :active, :boolean, default: true
  end
end
