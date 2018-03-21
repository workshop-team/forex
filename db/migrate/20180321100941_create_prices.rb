class CreatePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :prices do |t|
      t.string :instrument
      t.decimal :ask
      t.decimal :bid
      t.datetime :time

      t.timestamps
    end
  end
end
