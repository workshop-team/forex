class CreateGranularities < ActiveRecord::Migration[5.2]
  def change
    create_table :granularities do |t|
      t.string :name, null: false
      t.integer :value, null: false
      t.string :label

      t.timestamps
    end
  end
end
