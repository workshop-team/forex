class CreateStrategyLogicProviders < ActiveRecord::Migration[5.2]
  def change
    create_table :strategy_logic_providers do |t|
      t.references :strategy, foreign_key: true
      t.json :data

      t.timestamps
    end
  end
end
