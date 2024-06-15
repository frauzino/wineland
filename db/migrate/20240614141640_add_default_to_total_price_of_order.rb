class AddDefaultToTotalPriceOfOrder < ActiveRecord::Migration[7.0]
  def change
    change_column_default :orders, :total_price, 0.0
  end
end
