require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      category = Category.create(name: "Fitness")
      @product = category.products.new(name: "Skipping Rope", price_cents: 120, quantity: 20)
    end

    it "Validates all fields" do
      expect(@product).to be_valid
    end

    it "validates :name" do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it "validates :price" do
      @product.price_cents = nil
      expect(@product).to_not be_valid
    end

    it "validates :quantity" do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it "validates :category" do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end