defmodule Baz.Repo.Migrations.CreateCollectionPackTraits do
  use Ecto.Migration

  def change do
    create table(:collection_pack_traits) do
      add :collection_pack_id, references(:collection_packs), null: false
      add :trait_type, :text, null: false
      add :value, :text, null: false
      add :display_type, :text, null: false

      timestamps()
    end
  end
end
