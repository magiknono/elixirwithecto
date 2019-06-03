defmodule Elixirwithecto.Repo.Migrations.ChangeLanguageActualVersionColumn do
  use Ecto.Migration

  def change do
    alter table(:language) do
      modify :actual_version, :string
    end
  end
end
