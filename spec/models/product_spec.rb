require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it 'should save new product when all fields are present' do
      @category = Category.new(name: 'luxury clothing') 
      @product = Product.new(name: 'dress', category: @category, quantity: 2, price: 500)
      expect(@product).to be_valid
    end

    it 'validates name' do
      @category = Category.new(name: 'luxury clothing') 
      @product = Product.new(name: nil, category: @category, quantity: 2, price: 500)
      expect(@product).not_to be_valid 
      expect(@product.errors.full_messages[0]).to include("Name can't be blank")
    end

    it 'validates quantity' do
      @category = Category.new(name: 'luxury clothing') 
      @product = Product.new(name: 'dress', category: @category, quantity: nil, price: 500)
      expect(@product).not_to be_valid 
      expect(@product.errors.full_messages[0]).to include("Quantity can't be blank")
    end
    
    it 'validates category' do
      @category = Category.new(name: 'luxury clothing') 
      @product = Product.new(name: 'dress', category: nil, quantity: 2, price: 500)
      expect(@product).not_to be_valid 
      expect(@product.errors.full_messages[0]).to include("Category can't be blank")
    end

    it 'validates price' do
      @category = Category.new(name: 'luxury clothing') 
      @product = Product.new(name: 'dress', category: @category, quantity: 2, price: nil)
      expect(@product).not_to be_valid 
      expect(@product.errors.full_messages[1]).to include("Price is not a number")
      expect(@product.errors.full_messages[2]).to include("Price can't be blank")
    end
   


  end

end