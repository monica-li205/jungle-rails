require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here 
    category = Category.new(:name => "anything")
    subject { 
      described_class.new(
        name: "anything",
        price_cents: 1,
        quantity: 1,
        category: category)
    }

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is has a name" do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it "is has a price" do
      subject.price_cents = nil
      expect(subject).to_not be_valid
    end

    it "is has a quantity" do
      subject.quantity = nil
      expect(subject).to_not be_valid
    end

    it "is has a category" do
      subject.category = nil
      expect(subject).to_not be_valid
    end
  end
end