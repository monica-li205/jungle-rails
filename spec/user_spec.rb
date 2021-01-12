# must validate
# password and confirmation, mimumum length
# unique email
# email present
# first name and last name present
require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    subject {
      described_class.new(
        first_name:,
        last_name:,
        email:,
        password_digest:)
    }
    # validation tests/examples here
    it 'has a valid password and password confirmation' do
    end
    it 'has a unique email'
    it 'has a valid email'
    it
  end
end