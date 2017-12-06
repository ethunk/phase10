class CreateAttendeesTable < ActiveRecord::Migration
  def change
    create_table :attendees do |table|
      table.integer :meetupid, null: false
      table.integer :userid, null: false
    end
  end
end
