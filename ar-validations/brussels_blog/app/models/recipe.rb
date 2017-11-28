class Recipe < ActiveRecord::Base
  has_many :comments
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
  validates :serving, numericality: { greater_than_or_equal_to: 1 }
end
