class Book < ActiveRecord::Base
    validates :title, presence: true
    has_many :checkouts
    belongs_to :categorizations
end
