require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'valid attributes' do
    it 'is valid with a name and price' do
      product = Product.new(
        name: 'Product 1',
        price: 100
      )
      expect(product).to be_valid
    end
  end

  context 'invalid attributes' do
    it 'is invalid without a name' do
      product = Product.new(
        price: 100
      )
      expect(product).to_not be_valid
    end

    it 'is invalid without a price' do
      product = Product.new(
        name: 'Product 1'
      )
      expect(product).to_not be_valid
    end
  end
end
