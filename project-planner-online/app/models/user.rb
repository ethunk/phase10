class User < ActiveRecord::Base
  has_many :assignments
  has_many :projects
  has_many :projects, through: :assignments
  has_many :tasks
  validates :first_name, :last_name, presence: true
end
