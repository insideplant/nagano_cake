class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
   case resource
   when Admin
     admin_root_path
   when Customer
     root_path
   end
  end

  def after_sign_out_path_for(resource)
    if resource == :customer
      new_customer_session_path# ログアウト後に遷移するpathを設定
    else
      new_admin_session_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name,:last_name,:first_name,:last_name_kana,
    :first_name_kana,:email,:postal_code,:address,:telephone_number,:password,:password_confirmation, :is_active])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name,:last_name, :first_name,:last_name_kana,
    :first_name_kana,:postal_code,:address,:telephone_number,:is_active,:email,:encrypted_password,:password_confirmation])
  end

  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  # end

end
