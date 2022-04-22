defmodule Hello.SourceTest do
  use Hello.DataCase

  alias Hello.Source

  describe "samples" do
    alias Hello.Source.Sample

    import Hello.SourceFixtures

    @invalid_attrs %{accession: nil, comments: nil, file: nil, latitude: nil, link: nil, longitude: nil, origin: nil, species: nil}

    test "list_samples/0 returns all samples" do
      sample = sample_fixture()
      assert Source.list_samples() == [sample]
    end

    test "get_sample!/1 returns the sample with given id" do
      sample = sample_fixture()
      assert Source.get_sample!(sample.id) == sample
    end

    test "create_sample/1 with valid data creates a sample" do
      valid_attrs = %{accession: "some accession", comments: "some comments", file: "some file", latitude: "120.5", link: "some link", longitude: "120.5", origin: "some origin", species: "some species"}

      assert {:ok, %Sample{} = sample} = Source.create_sample(valid_attrs)
      assert sample.accession == "some accession"
      assert sample.comments == "some comments"
      assert sample.file == "some file"
      assert sample.latitude == Decimal.new("120.5")
      assert sample.link == "some link"
      assert sample.longitude == Decimal.new("120.5")
      assert sample.origin == "some origin"
      assert sample.species == "some species"
    end

    test "create_sample/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Source.create_sample(@invalid_attrs)
    end

    test "update_sample/2 with valid data updates the sample" do
      sample = sample_fixture()
      update_attrs = %{accession: "some updated accession", comments: "some updated comments", file: "some updated file", latitude: "456.7", link: "some updated link", longitude: "456.7", origin: "some updated origin", species: "some updated species"}

      assert {:ok, %Sample{} = sample} = Source.update_sample(sample, update_attrs)
      assert sample.accession == "some updated accession"
      assert sample.comments == "some updated comments"
      assert sample.file == "some updated file"
      assert sample.latitude == Decimal.new("456.7")
      assert sample.link == "some updated link"
      assert sample.longitude == Decimal.new("456.7")
      assert sample.origin == "some updated origin"
      assert sample.species == "some updated species"
    end

    test "update_sample/2 with invalid data returns error changeset" do
      sample = sample_fixture()
      assert {:error, %Ecto.Changeset{}} = Source.update_sample(sample, @invalid_attrs)
      assert sample == Source.get_sample!(sample.id)
    end

    test "delete_sample/1 deletes the sample" do
      sample = sample_fixture()
      assert {:ok, %Sample{}} = Source.delete_sample(sample)
      assert_raise Ecto.NoResultsError, fn -> Source.get_sample!(sample.id) end
    end

    test "change_sample/1 returns a sample changeset" do
      sample = sample_fixture()
      assert %Ecto.Changeset{} = Source.change_sample(sample)
    end
  end
end
