defmodule Hello.Repo.Migrations.CreateSamples do
  use Ecto.Migration

  def change do
    create table(:samples) do
      add :accession, :string
      add :species, :string
      add :origin, :string
      add :latitude, :decimal
      add :longitude, :decimal
      add :file, :string
      add :link, :string
      add :comments, :string

      timestamps()
    end
  end
end
