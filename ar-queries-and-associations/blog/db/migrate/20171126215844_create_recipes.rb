class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |table|
      table.string :title, null: false
      table.text :description, null: false
    end
  end
end
