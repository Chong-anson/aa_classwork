class ChangeAlbumType < ActiveRecord::Migration[5.2]
  def change
    change_column :albums, :album_type, :string, null: false
  end
end
