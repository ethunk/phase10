class Recipe < ActiveRecord::Base
  ALLOWABLE_STRINGS = ['Brussels Sprouts']
  has_many :comments
  validates :name, presence: true, uniqueness: true
  # validates :name, inclusion: { in: ALLOWABLE_STRINGS }
  # validates_inclusion_of :name, in: ['Brussels Sprouts']
  validates :description, presence: true
  validates :serving, numericality: { greater_than_or_equal_to: 1 }
  validates :name, format: {with: /\bbrussels\b/i, message: "Brussels Sprouts is needed" }
end





#need to validate inclusion for 'brussels sprouts'
