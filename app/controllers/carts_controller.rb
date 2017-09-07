class CartsController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'トップページ', :shop_top_path

  def show
    if @cart_product.nil?
       @error = "買い物カゴは空です"
       render shop_top_path
    else
      @cart = current_user.cart
      @cart_product = @cart.cart_products
      add_breadcrumb '商品一覧', :products_path
      add_breadcrumb '買い物カゴ'
    end
  end
  
end
