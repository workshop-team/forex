class AddFieldsToPrice < ActiveRecord::Migration[5.2]
  def change
    add_reference :prices, :strategy, foreign_key: true
    add_column :prices, :open, :decimal, null: false
    add_column :prices, :high, :decimal, null: false
    add_column :prices, :low, :decimal, null: false
    add_column :prices, :close, :decimal, null: false
    add_column :prices, :volume, :integer, null: false

    remove_column :prices, :ask, :decimal
    remove_column :prices, :bid, :decimal
    remove_column :prices, :instrument, :integer

    add_index :prices, [:strategy_id, :time], unique: true
  end
end
