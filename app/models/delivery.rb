class Delivery < ApplicationRecord

  belongs_to :customer

  validates :postcode, presence: true
  validates :address, presence: true
  validates :name, presence: true

  def full_delivery
    self.postcode + " " + self.address + " " + self.name
  end

end
