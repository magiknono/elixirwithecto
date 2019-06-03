defmodule Elixirwithecto.Repo.Migrations.AddColumnTimestampToLanguage do
  use Ecto.Migration

  def change do
    alter table(:language) do
      timestamps default: "2019-06-03 23:59:01", null: false
    end
  end
end

# https://stackoverflow.com/questions/35744390/how-to-add-timestamps-to-an-existing-table-with-ectos-timestamps
