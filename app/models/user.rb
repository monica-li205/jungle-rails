class User < ActiveRecord::Base
  has_secure_password
  validates_presence_of :first_name, :last_name, :email, :password_confirmation, :password
  validates_length_of :password, minimum: 5, on: :create
end
