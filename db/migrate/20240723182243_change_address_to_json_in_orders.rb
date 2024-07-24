class ChangeAddressToJsonInOrders < ActiveRecord::Migration[7.0]
  def change
    change_column :orders, :address, :jsonb, using: 'address::jsonb', default: {}
  end
end
