class AddGranularityToStrategy < ActiveRecord::Migration[5.2]
  def change
    add_reference :strategies, :granularity, foreign_key: true
    remove_column :strategies, :time_range
  end
end
