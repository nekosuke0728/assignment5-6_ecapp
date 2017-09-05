class OrdersController < ApplicationController
  before_action :authenticate_admin!, only:[:index]
  before_action :authenticate_user!, only:[:show, :create, :new]

  def new
    
  end

  def create
    cart = Cart.find_by(user_id: current_user.id)
    cart_products = CartProduct.where(cart_id: cart.id, status: true)

    total_price = 0
    cart_products.each do |cart_product|
      product = Product.find(cart_product.product_id)
      total_price += (cart_product.count * product.price)
    end

    order = Order.create(
      user_id: current_user.id,
      total_price: total_price,
      payment_method: 0
    )

    cart_products.each do |cart_product|
      order_product = OrderProduct.create(
        order_id: order.id,
        product_id: cart_product.product_id,
        count: cart_product.count
      )
      cart_product.destroy
    end
  end

  def index
    @orders = order.all
  end

  def show
    @orders = current_user.orders
  end

end
