class Product < ApplicationRecord
  has_many :product_images, dependent: :destroy
  accepts_attachments_for :product_images, attachment: :image

  has_many :cart_products
  has_many :carts, through: :cart_products

  has_many :order_products
  has_many :orders, through: :order_products

  belongs_to :category

  validates :name, presence: true
  validates :category_id, presence: true
  validates :price, presence: true
end
