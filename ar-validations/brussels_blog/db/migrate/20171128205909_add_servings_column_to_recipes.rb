class AddServingsColumnToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :serving, :integer
  end
end
