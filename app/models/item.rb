class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :genre_id
  end

  belongs_to :genre

  has_one_attached :image

  has_many :order_details
  has_many :order, through: :order_details
end
