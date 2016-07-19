class Api::V1::RegistrationsController < DeviseTokenAuth::RegistrationsController

  private

  def sign_up_params
    params.permit(:email, :password, :password_confirmation, :first_name, :last_name, :phone_number, :age, :experience, :is_admin, :is_vaadhyar, :state, :city, :region, :latitude, :longitude, :vedam, :classification)
  end
end
