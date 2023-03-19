class Order < ApplicationRecord
  enum payment: ["クレジットカード", "銀行振込"]
end
