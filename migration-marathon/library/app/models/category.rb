class Category < ActiveRecord::Base
  belongs_to :books
  belongs_to :categorizations
end
