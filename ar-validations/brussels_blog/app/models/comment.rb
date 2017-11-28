class Comment < ActiveRecord::Base
  validates :body, length: { maximum: 140 }, presence: true
  belongs_to :recipe
end
