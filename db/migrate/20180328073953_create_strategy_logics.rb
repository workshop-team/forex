class CreateStrategyLogics < ActiveRecord::Migration[5.2]
  def change
    create_table :strategy_logics do |t|
      t.string :class_name, null: false
      t.string :label, null: false

      t.timestamps
    end
  end
end
