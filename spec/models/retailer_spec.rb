require 'rails_helper'

RSpec.describe Retailer, type: :model do
  context 'valid attributes' do
    it 'is valid with a name, city, region and address' do
      retailer = Retailer.new(
        name: 'Retailer test',
        address: 'Address test',
        city: 'City test',
        region: 'Region test'
      )
      expect(retailer).to be_valid
    end
  end

  context 'invalid attributes' do
    it 'is invalid without a name' do
      retailer = Retailer.new(
        address: 'Address test',
        city: 'City test',
        region: 'Region test'
      )
      expect(retailer).to_not be_valid
    end

    it 'is invalid without an address' do
      retailer = Retailer.new(
        name: 'Retailer test',
        city: 'City test',
        region: 'Region test'
      )
      expect(retailer).to_not be_valid
    end

    it 'is invalid without a city' do
      retailer = Retailer.new(
        name: 'Retailer test',
        address: 'Address test',
        region: 'Region test'
      )
      expect(retailer).to_not be_valid
    end

    it 'is invalid without a region' do
      retailer = Retailer.new(
        name: 'Retailer test',
        address: 'Address test',
        city: 'City test'
      )
      expect(retailer).to_not be_valid
    end
  end
end
