class Song < ActiveRecord::Base
  validates :year, numericality: true, length: { is: 4 }
  validates :title, presence: true
  validates :artist, presence: true
  validates :album, presence: true
  validates :track_number
  validates :genre
  validates :length_in_seconds, presence: true, numericality: true
  validates :image
end
