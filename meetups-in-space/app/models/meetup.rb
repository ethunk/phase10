class Meetup < ActiveRecord::Base
  has_many :attendees
  has_many :users, through: :attendees
  validates :name, :location, :description, presence: true

  def creator
    meetup_id = self.id
    user_id = Attendee.where('meetup_id = ? AND creator = true ', meetup_id)[0].user_id
    return User.where('users.id = ?', user_id)[0].username
  end


  # SELECT meetups.id AS meetupid, users.username, users.avatar_url, attendees.creator FROM attendees
  # JOIN meetups ON meetups.id = attendees.meetupid
  # JOIN users ON users.id = attendees.user_id;


  # By convention, Rails guesses that the column used to hold the foreign key on this model is the
  # name of the association with the suffix _id added. The :foreign_key option lets you set the name
  # of the foreign key directly:

#   class Order < ActiveRecord::Base
#     belongs_to :customer, :class_name => "Patron", :foreign_key => "patron_id"
#   end

end
