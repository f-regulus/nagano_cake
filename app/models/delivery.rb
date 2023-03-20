class Delivery < ApplicationRecord

  belongs_to :customer

  def full_delivery
    self.postcode + " " + self.address + " " + self.name
  end

end
