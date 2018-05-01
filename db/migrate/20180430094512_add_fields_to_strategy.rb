class AddFieldsToStrategy < ActiveRecord::Migration[5.2]
  def change
    add_column :strategies, :units, :integer
    add_column :strategies, :status, :integer, default: 0, null: false
  end
end
