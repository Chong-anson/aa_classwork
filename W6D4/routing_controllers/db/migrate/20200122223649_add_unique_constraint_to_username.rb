class AddUniqueConstraintToUsername < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name
    add_column :users, :username, :string, unique: true, null: false
  end
end
