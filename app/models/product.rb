class Product < ApplicationRecord
  has_one_attached :image
  has_many :product_orders
  has_many :orders, through: :product_orders

  has_many :product_carts
  has_many :carts, through: :product_carts

  validates :name, presence: true
  validates :price, presence: true

end
