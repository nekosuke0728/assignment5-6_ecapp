class CartsController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'トップページ', :shop_top_path
  add_breadcrumb '商品一覧', :products_path

  def show
    @cart = current_user.cart
    @cart_product = @cart.cart_products
    add_breadcrumb '買い物カゴ'
  end
  
end
