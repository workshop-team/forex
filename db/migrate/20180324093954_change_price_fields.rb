class ChangePriceFields < ActiveRecord::Migration[5.2]
  def change
    Price.destroy_all
    remove_column :prices, :instrument, :string
    add_column :prices, :instrument, :integer, null: false
    change_column_null :prices, :ask, false
    change_column_null :prices, :bid, false
    change_column_null :prices, :time, false
  end
end
