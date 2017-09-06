class AdminHomeController < ApplicationController
  before_action :authenticate_admin!

  add_breadcrumb '管理者トップページ'

  def top
  end
end
