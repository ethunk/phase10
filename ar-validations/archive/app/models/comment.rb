class Comment < ActiveRecord::Base
  validates :body, length: {in: 1..140}, presence: true
  validates :recipe_id, presence: true
  belongs_to :recipe
end
