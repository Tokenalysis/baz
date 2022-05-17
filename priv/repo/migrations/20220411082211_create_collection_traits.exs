defmodule Baz.Repo.Migrations.CreateCollectionTraits do
  use Ecto.Migration

  def change do
    create table(:collection_traits) do
      add :collection_id, references(:collections), null: false
      add :trait_type, :text, null: false
      add :value, :text, null: false
      add :display_type, :text, null: false

      timestamps()
    end
  end
end
