class ChangeArtworkIdType < ActiveRecord::Migration[5.2]
  def change
    change_column :collection_records, :artwork_id, 'integer USING CAST(artwork_id AS integer)'
  end
end
