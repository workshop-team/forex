class AddPlToOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :pl, :decimal
    add_column :orders, :half_spread_cost, :decimal
  end
end
