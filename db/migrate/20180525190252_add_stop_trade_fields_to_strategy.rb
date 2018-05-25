class AddStopTradeFieldsToStrategy < ActiveRecord::Migration[5.2]
  def change
    add_column :strategies, :stop_loss, :integer
    add_column :strategies, :take_profit, :integer
  end
end
