class AddCityAndRegionToRetailers < ActiveRecord::Migration[7.0]
  def change
    add_column :retailers, :city, :string
    add_column :retailers, :region, :string
  end
end
