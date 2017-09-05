class Admins::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  # ログインしていてもリダイレクトでadmin_menu_top_pathに行かず、他のadminの追加が行えるよう
  prepend_before_action :require_no_authentication, :only => [ :cancel]
  # ログインしないとサインアップできないように
  prepend_before_action :authenticate_scope!, :only => [:new, :create ,:edit, :update, :destroy]

  # Strong Parameters の設定（name・statusを許可）①
  before_action :configure_permitted_parameters

  # パンくずリスト
  add_breadcrumb 'トップページ', :admin_home_top_path

  # GET /resource/sign_up
  def new
    add_breadcrumb '管理者アカウント登録'
    super
  end

  def account_update_params
    devise_parameter_sanitizer.sanitize(:account_update)
  end

  # POST /resource
  # adminを追加するとcurrent_adminが切り替わってしますのをデフォルトを書き換え制御する
  def create
    build_resource(sign_up_params)
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        # 追加
        redirect_to accounts_admin_index_path
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected
  # Strong Parameters の設定（name・statusを許可）②
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :status])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :status])
  end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
