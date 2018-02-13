class Project < ActiveRecord::Base
  has_many :assignments
  has_many :users
  has_many :users, through: :assignments
  validates :name, presence: true
  has_many :tasks
end
