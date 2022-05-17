defmodule Baz.Repo.Migrations.CreateCollectionPackCollections do
  use Ecto.Migration

  def change do
    create table(:collection_pack_collections) do
      add :collection_pack_id, references(:collection_packs), null: false
      add :collection_id, references(:collections), null: false

      timestamps()
    end

    create index(:collection_pack_collections, [:collection_pack_id, :collection_id], unique: true)
  end
end
