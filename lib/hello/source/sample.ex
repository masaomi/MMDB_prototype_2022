defmodule Hello.Source.Sample do
  use Ecto.Schema
  import Ecto.Changeset

  schema "samples" do
    field :accession, :string
    field :comments, :string
    field :file, :string
    field :latitude, :decimal
    field :link, :string
    field :longitude, :decimal
    field :origin, :string
    field :species, :string

    timestamps()
  end

  @doc false
  def changeset(sample, attrs) do
    sample
    |> cast(attrs, [:accession, :species, :origin, :latitude, :longitude, :file, :link, :comments])
    |> validate_required([:accession, :species, :origin, :latitude, :longitude, :file, :link, :comments])
  end
end
