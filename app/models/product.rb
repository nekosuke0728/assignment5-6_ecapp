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
  validates :description, presence: true

  # 商品新規登録時のエラーメッセージ重複を避ける
  after_validation :remove_unnecessary_error_messages
  def remove_unnecessary_error_messages
    errors.messages.delete(:category_id)
  end

end
