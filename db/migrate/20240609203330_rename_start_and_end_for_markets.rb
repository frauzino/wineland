class RenameStartAndEndForMarkets < ActiveRecord::Migration[7.0]
  def change
    rename_column :markets, :start, :start_date_time
    rename_column :markets, :end, :end_date_time
  end
end
