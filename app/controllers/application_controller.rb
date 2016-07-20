class ApplicationController < ActionController::Base
  include DeviseTokenAuth::Concerns::SetUserByToken

  protect_from_forgery with: :null_session

  prepend_before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: user_keys)
    devise_parameter_sanitizer.permit(:account_update, keys: user_keys)
  end

  def user_keys
    [:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :age, :experience, :is_admin, :is_vaadhyar, :state, :city, :region, :latitude, :longitude, :vedam => [], :classification => []]
  end
end
