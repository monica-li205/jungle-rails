# must validate
# password and confirmation, mimumum length
# unique email
# email present
# first name and last name present
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do

    user = User.new(
      first_name: "Anything",
      last_name:"Anything",
      email: "Anything@Anything.com",
      password_field: "password",
      password_confirmation: "password")
    
    # validation tests/examples here
    it 'is valid with valid attributes' do
      expect(user).to be_valid
      user.save
    end

    it 'has a valid password' do
      user.password = nil
      user.save
      expect(user).to_not be_valid
    end

    it 'has a valid password confirmation' do
      user.password_confirmation = nil
      user.save
      expect(user).to_not be_valid
    end
    
    it 'has a unique email' do
      newUser = User.new(
      first_name: "Any",
      last_name:"thing",
      email: "Anything@Anything.com",
      password_field: "password",
      password_confirmation: "password")
      newUser.save
      expect(newUser).to_not be_valid
    end

    it 'has a valid email' do
      user.email = nil
      expect {user.save}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has a valid first name' do
      user.first_name = nil
      user.save
      expect {user.save}.to raise_error(ActiveRecord::RecordInvalid)
    end

    it 'has a valid last name' do
      user.last_name = nil
      user.save
      expect {user.save}.to raise_error(ActiveRecord::RecordInvalid)
    end

  end
end