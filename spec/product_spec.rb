require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here 
    category = Category.new(:name => "anything")
    product = Product.new(
      :name => "anything",
      :price_cents => 1,
      :quantity => 1,
      :category => category)

    it "is valid with valid attributes" do
      expect(product).to be_valid
      product.save
    end

    it "is has a name" do
      product.name = nil
      product.save
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Name can't be blank")
    end

    it "is has a price" do
      product.price_cents = nil
      product.save
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Price is not a number")
    end

    it "is has a quantity" do
      product.quantity = nil
      product.save
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Quantity can't be blank")

    end

    it "is has a category" do
      product.category = nil
      product.save
      expect(product).to_not be_valid
      expect(product.errors.full_messages).to include("Category can't be blank")

    end
  end
end