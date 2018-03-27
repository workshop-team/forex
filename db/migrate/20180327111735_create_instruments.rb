class CreateInstruments < ActiveRecord::Migration[5.2]
  def change
    create_table :instruments do |t|
      t.string :name, null: false
      t.string :label, null: false

      t.timestamps
    end
  end
end
