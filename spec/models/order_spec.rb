require 'rails_helper'

RSpec.describe Order, type: :model do
  context 'with valid attributes' do
    it 'is valid with a product but no user' do
      product = Product.new(name: 'Test Product', price: 10.50)
      order = Order.new(total_price: 10.50)
      order.products << product
      expect(order).to be_valid
    end

    it 'is valid with a user and a product' do
      user = User.new(email: 'test@test.com', password: 'password')
      product = Product.new(name: 'Test Product', price: 10.50)
      order = Order.new(total_price: 10.50, user: user)
      order.products << product
      expect(order).to be_valid
    end

    it 'is valid with a product of $0.00' do
      product = Product.new(name: 'Test Product', price: 0.00)
      order = Order.new
      order.products << product
      expect(order).to be_valid
    end

    it 'is valid with multiple products' do
      product1 = Product.new(name: 'Test Product 1', price: 10.50)
      product2 = Product.new(name: 'Test Product 2', price: 20.50)
      order = Order.new(total_price: 31.00)
      order.products << product1
      order.products << product2
      expect(order).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without products' do
      order = Order.new(total_price: 10.50)
      order.valid?
      expect(order.errors[:base]).to include('must have at least one product')
    end
  end
end
