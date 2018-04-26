class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :strategy, foreign_key: true
      t.decimal :price_buy, null: false
      t.decimal :price_sell
      t.integer :units, null: false

      t.timestamps
    end
  end
end
