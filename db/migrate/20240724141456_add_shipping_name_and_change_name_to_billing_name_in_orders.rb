class AddShippingNameAndChangeNameToBillingNameInOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :shipping_name, :string
    rename_column :orders, :name, :billing_name
  end
end
