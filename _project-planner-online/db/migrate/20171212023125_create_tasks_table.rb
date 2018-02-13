class CreateTasksTable < ActiveRecord::Migration
  def change
    create_table :tasks do |table|
      table.string :name, null: false
      table.string :description, null: true
      table.date :due_date, null: true
      table.integer :user_id, null: true
      table.integer :project_id, unique: true  
    end
  end
end
