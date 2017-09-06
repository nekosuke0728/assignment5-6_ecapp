class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def top_add_breadcrumb
    if admin_signed_in?
      add_breadcrumb '管理者トップページ', :admin_home_top_path
    else
      add_breadcrumb 'トップページ', :shop_top_path
    end
  end

end
