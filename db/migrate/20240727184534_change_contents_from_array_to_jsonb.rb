class ChangeContentsFromArrayToJsonb < ActiveRecord::Migration[7.0]
  def change
    remove_column :products, :contents
    add_column :products, :contents, :jsonb, default: {}
  end
end
