class AddNameAndBillingAddressToOrders < ActiveRecord::Migration[7.0]
  def change
    add_column :orders, :name, :string
    add_column :orders, :billing_address, :jsonb, default: {}
  end
end
