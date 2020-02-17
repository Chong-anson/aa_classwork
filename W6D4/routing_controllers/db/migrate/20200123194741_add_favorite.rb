class AddFavorite < ActiveRecord::Migration[5.2]
  def change
    add_column :artworks, :favorite, :boolean
    add_column :artwork_shares, :favorite, :boolean

  end
end
