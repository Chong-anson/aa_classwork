class CreateCollectionRecords < ActiveRecord::Migration[5.2]
  def change
    create_table :collection_records do |t|
      t.integer :collection_id, null: false 
      t.string :artwork_id , null: false 
      t.timestamps
    end

    add_index :collection_records, :collection_id 
    add_index :collection_records, :artwork_id
    add_index :collection_records, [:collection_id, :artwork_id], unique: true


  end
end
