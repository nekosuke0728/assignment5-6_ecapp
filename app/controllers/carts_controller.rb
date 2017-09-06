class CartsController < ApplicationController
  before_action :authenticate_user!

  def show
    @cart = current_user.cart
    @cart_product = @cart.cart_products
  end
  
end
