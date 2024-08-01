class RenameProductsOrdersToOrderItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :product_orders, :order_items

    add_column :order_items, :contents, :jsonb, default: {}
  end
end
