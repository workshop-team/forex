class CreateStrategies < ActiveRecord::Migration[5.2]
  def change
    create_table :strategies do |t|
      t.string :name, null: false
      t.integer :time_range, null: false
      t.references :instrument, foreign_key: true
      t.references :strategy_logic, foreign_key: true

      t.timestamps
    end
  end
end
