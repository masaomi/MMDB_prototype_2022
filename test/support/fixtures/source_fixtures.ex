defmodule Hello.SourceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Hello.Source` context.
  """

  @doc """
  Generate a sample.
  """
  def sample_fixture(attrs \\ %{}) do
    {:ok, sample} =
      attrs
      |> Enum.into(%{
        accession: "some accession",
        comments: "some comments",
        file: "some file",
        latitude: "120.5",
        link: "some link",
        longitude: "120.5",
        origin: "some origin",
        species: "some species"
      })
      |> Hello.Source.create_sample()

    sample
  end
end
