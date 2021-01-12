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
        first_name
        last_name
      )
    }
    # validation tests/examples here
    it ''
  end
end