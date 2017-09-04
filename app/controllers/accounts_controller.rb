class AccountsController < ApplicationController
  before_action :authenticate_admin!

  def admin_index
    @admins = Admin.all
  end

  def user_index
    @users = User.all
  end

end
