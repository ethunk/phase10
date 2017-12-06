class CreateMeetupsTable < ActiveRecord::Migration
  def change
    create_table :meetups do |table|
      table.string :name, null: false
      table.string :location, null: false
      table.date :date, null: false
      table.time :start_time, null: false
      table.time :end_time
      table.text :description, null: false
    end
  end
end
