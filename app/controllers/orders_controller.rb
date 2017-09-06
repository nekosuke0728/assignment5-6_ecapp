class OrdersController < ApplicationController
  before_action :authenticate_admin!, only:[:index]
  before_action :authenticate_user!, only:[:show, :create, :new]

  # user 注文確認画面
  def new
    @cart = current_user.cart
    @cart_products = CartProduct.where(cart_id: @cart.id, status: true)
    @user = current_user
    @user_info = current_user.user_info
    @order = Order.new
  end

  def create
    @cart = current_user.cart
    @user = current_user
    @user_info = current_user.user_info
    @order = Order.create(order_params)
    @order.save

    cart = Cart.find_by(user_id: current_user.id)
    @cart_products = CartProduct.where(cart_id: cart.id, status: true)

    sub_total = 0
    @cart_products.each do |cart_product|

      product = Product.find(cart_product.product_id)
      sub_total = (cart_product.count * product.price)

      order_product = OrderProduct.create(
        order_id: @order.id,
        product_id: cart_product.product_id,
        count: cart_product.count,
        sub_total: sub_total
      )

      cart_product.destroy
    end

    OrderMailer.confirmation_of_order(current_user,@order).deliver    

    redirect_to order_path(current_user)

  end

  # admin 販売履歴一覧
  def index
    @orders = order.all
  end

  # user 注文履歴一覧
  def show
    @order = current_user.orders
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :total_price, :payment_method)
  end

end
