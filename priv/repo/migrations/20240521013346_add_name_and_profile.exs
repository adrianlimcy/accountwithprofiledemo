defmodule Accountwithprofiledemo.Repo.Migrations.AddNameAndProfile do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :name, :string
      add :profile, :string
    end

  end
end
