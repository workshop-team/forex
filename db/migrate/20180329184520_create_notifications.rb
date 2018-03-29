class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|
      t.string :type, null: false
      t.string :info, null: false

      t.timestamps
    end
  end
end
