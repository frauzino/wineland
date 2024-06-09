require 'rails_helper'

RSpec.describe Market, type: :model do
  context 'with valid attributes' do
    it 'is valid' do
      market = Market.new(name: 'Market', address: '123 Main St', start: Time.now, end: Time.now + 1.day)
      expect(market).to be_valid
    end
  end

  context 'with invalid attributes' do
    it 'is invalid without a name' do
      market = Market.new(address: '123 Main St', start: Time.now, end: Time.now + 1.day)
      market.valid?
      expect(market.errors[:name]).to include("can't be blank")
    end

    it 'is invalid without an address' do
      market = Market.new(name: 'Market', start: Time.now, end: Time.now + 1.day)
      market.valid?
      expect(market.errors[:address]).to include("can't be blank")
    end

    it 'is invalid without a start date' do
      market = Market.new(name: 'Market', address: '123 Main St', end: Time.now + 1.day)
      market.valid?
      expect(market.errors[:start]).to include("can't be blank")
    end

    it 'is invalid without an end date' do
      market = Market.new(name: 'Market', address: '123 Main St', start: Time.now)
      market.valid?
      expect(market.errors[:end]).to include("can't be blank")
    end

    it 'is invalid with an end date before the start date' do
      market = Market.new(name: 'Market', address: '123 Main St', start: Time.now, end: Time.now - 1.day)
      market.valid?
      expect(market.errors[:end]).to include('must be after start date')
    end
  end
end
