class Cart < ApplicationRecord
  belongs_to :user, optional: true

  has_many :product_carts, dependent: :destroy
  has_many :products, through: :product_carts
end
