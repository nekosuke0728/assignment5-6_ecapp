class AccountsController < ApplicationController
  before_action :authenticate_admin!

  add_breadcrumb '管理者トップページ', :admin_home_top_path

  def admin_index
    @admins = Admin.all
    add_breadcrumb '管理者アカウント一覧'
  end

  def user_index
    @users = User.all
    add_breadcrumb 'ユーザーアカウント一覧'
  end

end
