class RenameProductCartsToCartItems < ActiveRecord::Migration[7.0]
  def change
    rename_table :product_carts, :cart_items

    add_column :cart_items, :contents, :jsonb, default: {}
  end
end
