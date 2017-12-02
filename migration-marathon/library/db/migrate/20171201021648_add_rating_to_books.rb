class AddRatingToBooks < ActiveRecord::Migration
  def change
    add_column :books, :rating, :numeric, scale: 100
  end
end
