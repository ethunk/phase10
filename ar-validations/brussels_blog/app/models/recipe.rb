class Recipe < ActiveRecord::Base
  validates :title, inclusion: { in: ['brussels', 'Brussels']}, presence: true
  has_many :comments
end
