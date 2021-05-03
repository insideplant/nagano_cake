class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_customer!,except: [:top, :items, :about, :index]
  before_action :authenticate_admin!
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  def after_sign_in_path_for(resource)
    mypage_root_path # ログイン後に遷移するpathを設定
  end
  
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:user_name,:last_name, :first_name,:last_name_kana,
    :first_name_kana,:postal_code,:adress,:telephone_number,:is_active,:email,:encrypted_password,:password_confirmation])
  end
  
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  # end
  
end
