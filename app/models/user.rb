class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :validatable, :rememberable
  include DeviseTokenAuth::Concerns::User

  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :phone_number, presence: true, uniqueness: true
  validates :age, presence: true
  validates :experience, presence: true
end
