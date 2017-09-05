class UserInfosController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    if @user.user_info.nil?
      redirect_to new_user_info_path
    else
      @user_info = current_user.user_info
    end
  end

  def new
    @user = current_user
    @user_info = UserInfo.new
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
