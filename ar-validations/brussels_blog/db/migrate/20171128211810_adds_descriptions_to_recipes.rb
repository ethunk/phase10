class AddsDescriptionsToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :description, :text, null: false
  end
end
