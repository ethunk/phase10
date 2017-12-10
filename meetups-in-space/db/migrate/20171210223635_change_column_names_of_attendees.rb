class ChangeColumnNamesOfAttendees < ActiveRecord::Migration
  def change
    rename_column :attendees, :meetupid, :meetup_id
    rename_column :attendees, :userid, :user_id
  end
end
