class CartsController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'トップページ', :shop_top_path
  add_breadcrumb '商品一覧', :products_path
  add_breadcrumb '買い物カゴ' 

  def show
    @cart = current_user.cart
    unless @cart.nil?
      @cart_product = @cart.cart_products
    end
  end

end
