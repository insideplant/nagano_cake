class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :authenticate_customer!,except: [:top, :items, :about, :index]
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:user_name])
  end
  
  # def configure_permitted_parameters
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:email])
  # end
  
end
