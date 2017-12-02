class AddFavoriteToBooks < ActiveRecord::Migration
  def change
    add_column :books, :favorite, :boolean, null: false, default: false
  end
end
