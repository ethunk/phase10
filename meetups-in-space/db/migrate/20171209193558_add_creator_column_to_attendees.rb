class AddCreatorColumnToAttendees < ActiveRecord::Migration
  def change
    add_column :attendees, :creator, :boolean, default: false
  end
end
