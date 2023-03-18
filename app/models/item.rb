class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :genre_id
    validates :is_active
  end
  
  belongs_to :genre
  
  has_one_attached :image
end
