class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :validatable
  include DeviseTokenAuth::Concerns::User

  validates :phone_number, presence: true, uniqueness: true
  validates :age, presence: true
  validates :experience, presence: true
end
