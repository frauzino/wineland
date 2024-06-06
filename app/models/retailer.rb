class Retailer < ApplicationRecord

  validates :name, presence: true
  validates :address, presence: true
  validates :city, presence: true
  validates :region, presence: true
end
