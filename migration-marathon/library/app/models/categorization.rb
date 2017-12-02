class Categorization < ActiveRecord::Base
  has_many :book_id
  has_many :category_id
end
