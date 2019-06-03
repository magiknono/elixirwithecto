defmodule Elixirwithecto.Repo.Migrations.CreateLanguage do
  use Ecto.Migration

  def change do
    create table(:language) do
      add :name, :string, null: false
      add :first_version, :integer, default: 0
      add :paradigm, :string
      add :actual_version, :float
      add :active, :boolean, default: true
    end
  end
end
