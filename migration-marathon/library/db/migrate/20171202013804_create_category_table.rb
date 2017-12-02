class CreateCategoryTable < ActiveRecord::Migration
  def change
    create_table :categories do |table|
      table.string :category, unique: true
      table.integer :book_id
    end
  end
end
