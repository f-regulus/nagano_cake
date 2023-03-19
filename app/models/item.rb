class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :image
    validates :genre_id
  end
  
  belongs_to :genre
  
  has_one_attached :image
end
