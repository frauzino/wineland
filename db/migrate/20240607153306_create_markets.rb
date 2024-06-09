class CreateMarkets < ActiveRecord::Migration[7.0]
  def change
    create_table :markets do |t|
      t.string :name
      t.text :description
      t.string :address
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
