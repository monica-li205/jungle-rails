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

    it 'has a valid first name' do
      user = User.new(
        first_name: nil,
        last_name:"Anything",
        email: "Anything@Anything.com",
        password: "password",
        password_confirmation: "password")
      expect(user).to_not be_valid
      user.save
    end

    it 'has a valid last name' do
      user = User.new(
        first_name: "Anything",
        last_name: nil,
        email: "Anything@Anything.com",
        password: "password",
        password_confirmation: "password")
      expect(user).to_not be_valid
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

    it 'has a unique email' do
      user = User.new(
        first_name: "Anything",
        last_name:"Anything",
        email: "Anything@Anything.com",
        password: "password",
        password_confirmation: "password")
      user.save
      user2 = User.new(
        first_name: "Anything",
        last_name:"Anything",
        email: "Anything@Anything.com",
        password: "password1",
        password_confirmation: "password1")
      user2.save
      expect(user2).to_not be_valid
    end
  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    currentUser = User.new(
      first_name: "Anything",
      last_name:"Anything",
      email: "Anything@Anything.com",
      password: "password",
      password_confirmation: "password")

    it 'trims spaces around the email if present' do
      currentUser.email = '   Anything@Anything.com  '
      currentUser.save
      expect(currentUser).to be_valid
    end

    it 'ignores letter case for emails' do
      currentUser.email = 'anything@anything.COM'
      currentUser.save
      expect(currentUser).to be_valid
    end  
  end
end