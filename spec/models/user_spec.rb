# must validate
# password and confirmation, mimumum length
# unique email
# email present
# first name and last name present
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    # validation tests/examples here
    it 'is valid with valid attributes' do
      user = User.new(
        first_name: "Anything",
        last_name:"Anything",
        email: "Anything@Anything.com",
        password: "password",
        password_confirmation: "password")
      expect(user).to be_valid
      user.save
    end

    it 'has a valid password' do
      user = User.new(
        first_name: "Anything",
        last_name:"Anything",
        email: "Anything@Anything.com",
        password: nil,
        password_confirmation: "password")
      user.save
      expect(user).to_not be_valid
    end

    it 'has a valid password 5 letters or longer' do
      user = User.new(
        first_name: "Anything",
        last_name:"Anything",
        email: "Anything@Anything.com",
        password: "cat",
        password_confirmation: "cat")
      expect(user).to_not be_valid
    end

    it 'has a password confirmation that matches the password' do
      user = User.new(
        first_name: "Anything",
        last_name:"Anything",
        email: "Anything@Anything.com",
        password: "password",
        password_confirmation: "pass" )
      user.save
      expect(user).to_not be_valid
    end
    
    it 'has a unique email' do
      user = User.new(
        first_name: "Anything",
        last_name:"Anything",
        email: "Anything@Anything.com",
        password: "password",
        password_confirmation: "pass")

    end

    it 'has a valid email' do
      user = User.new(
        first_name: "Anything",
        last_name:"Anything",
        email: nil,
        password: "password",
        password_confirmation: "password")
      user.save
      expect(user).to_not be_valid
    end

    it 'has a valid first name' do
      user.first_name = nil
      user.save
    end

    it 'has a valid last name' do
      user.last_name = nil
      user.save
    end

  end
end