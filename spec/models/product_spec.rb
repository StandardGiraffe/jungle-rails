require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before :each do
      @category = Category.new
      @product = @category.products.new
    end

    # validation tests/examples here

    it "is not valid unless it has a name" do
      @product.price = 50
      @product.quantity = 50
      @product.name = nil
      expect(@product).to_not be_valid
      puts @product.errors.full_messages
    end

    it "is not valid unless it has a price" do
      @product.price = nil
      @product.quantity = 50
      @product.name = "Bob"
      expect(@product).to_not be_valid
      puts @product.errors.full_messages
    end

    it "is not valid unless it has a quantity" do
      @product.price = 50
      @product.quantity = nil
      @product.name = "Bob"
      expect(@product).to_not be_valid
      puts @product.errors.full_messages
    end

    it "is not valid unless it has a category" do
      @product.price = 50
      @product.category = nil
      @product.quantity = 50
      @product.name = "Bob"
      expect(@product).to_not be_valid
      puts @product.errors.full_messages
    end


    it "is valid if it has name, price, quantity, and category" do
      @product.price = 50
      @product.quantity = 50
      @product.name = "Bob"
      expect(@product).to be_valid
      puts @product.errors.full_messages
    end

  end
end