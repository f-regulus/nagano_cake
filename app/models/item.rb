class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :introduction
    validates :price
    validates :image
    validates :genre_id
  end

  belongs_to :genre

  has_many :cart_items, dependent: :destroy

  has_one_attached :image

  # 消費税を求めるメソッド
  def with_tax_price
    (price * 1.1).floor
  end
  
  def self.search_for(word)
    Item.where('name LIKE ?', '%' + word + '%' )
  end
end
