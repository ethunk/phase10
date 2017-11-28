class CreateRecipes < ActiveRecord::Migration[5.1]
  def change
    create_table :recipes do |table|
      table.string :title, null: false
      table.string :description, null: false
    end
  end
end
