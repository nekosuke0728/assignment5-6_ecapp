class UserInfosController < ApplicationController
  before_action :authenticate_user!

  add_breadcrumb 'トップページ', :shop_top_path

  def show
    @user = current_user
    if @user.user_info.nil?
      redirect_to new_user_info_path
    else
      @user_info = current_user.user_info
    end
    add_breadcrumb 'ユーザー詳細情報'
  end

  def new
    @user = current_user
    @user_info = UserInfo.new
    add_breadcrumb 'ユーザー詳細情報', :user_info_path
    add_breadcrumb '作成'
  end

  def create
    @user = current_user
    @user_info = UserInfo.new(user_info_params)
    @user_info.user_id = @user.id
    if @user_info.save
       redirect_to user_info_path(@user.id), notice: '登録が完了しました'
    # else
    end
  end

  def edit
    @user = current_user
    @user_info = current_user.user_info
    add_breadcrumb 'ユーザー詳細情報', :user_info_path
    add_breadcrumb '編集'
  end

  def update
    @user = current_user
    @user_info = current_user.user_info
    @user_info.user_id = @user.id
    @user_info.update(user_info_params)
    redirect_to user_info_path(current_user.id)
  end

  private

  def user_info_params
    params.require(:user_info).
      permit(:firstname, :lastname, :zipcode, :prefecture, :city, :block, :building, :phone)
  end

end
