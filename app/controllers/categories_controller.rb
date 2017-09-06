class CategoriesController < ApplicationController
  before_action :authenticate_admin!, only:[:new, :create, :edit, :update, :destroy]

  def category_add_breadcrumb
    if admin_signed_in?
      add_breadcrumb '管理者トップページ', :admin_home_top_path
      add_breadcrumb '販売商品管理一覧', :products_path
      add_breadcrumb 'カテゴリ管理', :categories_path
    else
      add_breadcrumb 'トップページ', :shop_top_path
      add_breadcrumb '商品一覧', :products_path
      add_breadcrumb 'カテゴリ別', :categories_path
    end    
  end

  def index
    @categories = Category.page(params[:page]).per(50)
    category_add_breadcrumb
  end

  def show
    @category = Category.find_by(id: params[:id])
    @products = Kaminari.paginate_array(Product.where(category_id: params[:id]))
                        .page(params[:page]).per(10)
    top_add_breadcrumb
    category_add_breadcrumb
    add_breadcrumb @category.name
  end

  def new
    @category = Category.new
    top_add_breadcrumb
    category_add_breadcrumb
    add_breadcrumb 'カテゴリ新規作成'
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
    top_add_breadcrumb
    category_add_breadcrumb
    add_breadcrumb @category.name, :category_path
    add_breadcrumb 'カテゴリ編集'
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
