class CreateCommands < ActiveRecord::Migration[5.2]
  def change
    create_table :commands do |t|
      t.string :name, null: false
      t.json :params
      t.boolean :execute, default: false

      t.timestamps
    end
  end
end
