class AddOrderReferenceToProduct < ActiveRecord::Migration[7.0]
  def change
    add_reference :products, :order, foreign_key: true
  end
end
