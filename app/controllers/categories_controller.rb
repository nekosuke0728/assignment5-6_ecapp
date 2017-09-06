class CategoriesController < ApplicationController
  before_action :authenticate_admin!, only:[:new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.page(params[:page]).per(50) 
    if admin_signed_in?
      add_breadcrumb 'トップページ', :admin_home_top_path
      add_breadcrumb 'カテゴリ管理', :categories_path
    else
      add_breadcrumb 'トップページ', :shop_top_path
      add_breadcrumb 'カテゴリ別', :categories_path
    end
  end

  def show
    @category = Category.find_by(id: params[:id])
    @products = Kaminari.paginate_array(Product.where(category_id: params[:id]))
                        .page(params[:page]).per(10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to categories_path
    else
      render 'new'
    end
  end

  def edit
    @category = Category.find_by(id: params[:id])
  end

  def update
    @category = Category.find_by(id: params[:id])
    @category.update(category_params)
    redirect_to categories_path    
  end

  def destroy
    @category = Category.find_by(id: params[:id])
    @category.destroy
    redirect_to categories_path  
  end

  private

  def category_params
    params.require(:category).permit(:name)
  end

end
