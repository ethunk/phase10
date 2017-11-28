class Recipe < ActiveRecord::Base
  validates :title, inclusion: { with: ['brussels sprouts', 'Brussels sprouts']}, presence: true
  validates :serving, numericality: {greater_than_or_equal_to: 1}
  has_many :comments
end
