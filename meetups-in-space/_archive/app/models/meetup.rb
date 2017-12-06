class Meetup < ActiveRecord::Base
  has_many :users, through: :attendees
  validates :name, :location, :description, presence: true
end
