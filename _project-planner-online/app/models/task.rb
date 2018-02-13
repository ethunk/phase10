class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user #keep singular
  validates :name, presence: true
end
