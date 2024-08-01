class Order < ApplicationRecord
  has_many :order_items
  has_many :products, through: :order_items

  belongs_to :user, optional: true

  validates :total_price, presence: true
  validate :must_have_products

  private

  def must_have_products
    errors.add(:base, 'must have at least one product') if order_items.empty?
  end

end
