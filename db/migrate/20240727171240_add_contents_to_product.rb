class AddContentsToProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :contents, :text, array: true, default: []
  end
end
