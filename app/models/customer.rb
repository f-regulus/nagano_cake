class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  with_options presence: true do
    validates :first_name
    validates :last_name
    validates :kana_first_name
    validates :kana_last_name
    validates :postal_code
    validates :telephone_number
  end

  has_many :delivery, dependent: :destroy
  has_many :cart_items, dependent: :destroy
  has_many :orders, dependent: :destroy

  # 退会機能　is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def kana_full_name
    self.kana_first_name + " " + self.kana_last_name
  end

end