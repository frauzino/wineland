class AddDefaultValueToTotalPriceInCart < ActiveRecord::Migration[7.0]
  def change
    change_column_default :carts, :total_price, 0.0
  end
end
