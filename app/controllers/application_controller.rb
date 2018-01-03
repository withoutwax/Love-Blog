class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :configure_devise_params, if: :devise_controller?
  #
  # protected
  #
  #   # def configure_devise_params
  #   #   devise_parameter_sanitizer.for(:sign_up) do |u|
  #   #     u.permit(:username, :name, :email, :password, :password_confirmation)
  #   #   end
  #   # end
  #   def configure_devise_params
  #     devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :username, :email, :password, :password_confirmation)}
  #     devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :username, :email, :password, :password_confirmation) }
  #   end
end
