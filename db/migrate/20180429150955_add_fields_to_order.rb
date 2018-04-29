class AddFieldsToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :time_buy, :datetime, null: false
    add_column :orders, :time_sell, :datetime
    add_column :orders, :oanda_buy_order_id, :integer, null: false
    add_column :orders, :oanda_sell_order_id, :integer
  end
end
