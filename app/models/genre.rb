class Genre < ApplicationRecord
  validates :genre_name, presence: true
  has_many :items
end
