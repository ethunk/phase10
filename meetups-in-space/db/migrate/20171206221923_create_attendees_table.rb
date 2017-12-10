class CreateAttendeesTable < ActiveRecord::Migration
  def change
    create_table :attendees do |table|
      table.integer :meetup_id, null: false
      table.integer :user_id, null: false
    end
  end
end
