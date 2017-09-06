class CartProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    unless user_signed_in?
      render new_user_registration_path
    else
      if current_user.cart.blank?
        @cart = Cart.new
        @cart.user_id = current_user.id
        @cart.save
      end
      @cart_product = CartProduct.new(cart_product_params)
      @cart_product.cart_id = current_user.id
      @cart_product.save
      redirect_to cart_path(current_user.id)
    end
  end

  def status_change
    cart_product = CartProduct.find(params[:id])
    if cart_product.status == false
      cart_product.update(status: true)
    else
      cart_product.update(status: false)
    end
    redirect_to cart_path(current_user.id)
  end

  def destroy
    @cart_product = CartProduct.find_by(id: params[:id])
    @cart_product.destroy
    redirect_to cart_path(current_user.id)
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:cart_id, :product_id, :count, :status)
  end

  # def order_params
  #   params.require(:order).permit(:user_id, :total_price, :payment_method)
  # end

end

