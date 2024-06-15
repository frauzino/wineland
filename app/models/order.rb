class Order < ApplicationRecord
  has_many :product_orders
  has_many :products, through: :product_orders

  belongs_to :user

  validates :total_price, presence: true
  validate :must_have_products

  private

  def must_have_products
    errors.add(:base, 'must have at least one product') if products.empty?
  end

end
