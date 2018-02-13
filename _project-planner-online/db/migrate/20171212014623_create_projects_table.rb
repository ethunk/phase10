class CreateProjectsTable < ActiveRecord::Migration
  def change
    create_table :projects do |table|
      table.string :name, null: false
      table.string :description, null: true
    end
  end
end
