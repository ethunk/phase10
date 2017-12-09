class Meetup < ActiveRecord::Base
  has_many :users, through: :attendees
  validates :name, :location, :description, presence: true

  def creator
    meetup_id = self.id
    userid = Attendee.where('meetupid = ? AND creator = true ', meetup_id)[0].userid
    return User.where('users.id = ?', userid)[0].username
  end

end
