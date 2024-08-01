class Product < ApplicationRecord
  has_one_attached :image
  has_many :order_items
  has_many :orders, through: :order_items

  has_many :cart_items
  has_many :carts, through: :cart_items

  validates :name, presence: true
  validates :price, presence: true

end
