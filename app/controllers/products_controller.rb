class ProductsController < ApplicationController
  before_action :authenticate_admin!, only:[:new, :create, :edit, :update, :destroy]

  def index
    @products = Product.page(params[:page]).per(50) 
    if admin_signed_in?
      add_breadcrumb 'トップページ', :admin_home_top_path
      add_breadcrumb '販売商品管理一覧', :products_path
    else
      add_breadcrumb 'トップページ', :shop_top_path
      add_breadcrumb '販売商品一覧', :products_path
    end
  end

  def show
    @product = Product.find_by(id: params[:id])
  end

  def new
    @product = Product.new
    @product.product_images.build
    @product.build_category
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to products_path
    else
      render 'new'
    end    
  end

  def edit
    @product = Product.find_by(id: params[:id])
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(product_params)
    redirect_to products_path
  end

  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    redirect_to products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :price, :description, :category_id, product_images_images: [])
  end
end
