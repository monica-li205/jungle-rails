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
      password_digest: "password")
    
    # validation tests/examples here
    it 'is valid with valid attributes' do
      expect(user).to be_valid
      user.save
    end

    it 'has a valid password and password confirmation is present' do
      
    end
    
    it 'has a unique email' do
    end

    it 'has a valid email' do
    end

    it 'has a valid first name' do
      user.first_name = nil
      expect(user).to_not be_valid
      user.save
    end

    it 'has a valid last name' do
    end

  end
end