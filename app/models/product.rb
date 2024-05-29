class Product < ApplicationRecord
  has_one_attached :image

  vakidates :name, presence: true
  validates :price, presence: true

end
