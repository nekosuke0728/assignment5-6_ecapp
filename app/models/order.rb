class Order < ApplicationRecord
  belongs_to :user
  has_many :order_products
  has_many :products, through: :order_products
  
  enum payment_method: { transfer: 0, cod: 1, credit: 2, paypal: 3 }

end
