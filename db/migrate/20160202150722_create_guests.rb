class CreateGuests < ActiveRecord::Migration[5.0]
  def change
    create_table :guests do |t|
      t.references :meal, foreign_key: true
      t.references :resident, foreign_key: true
      t.integer :multiplier, null: false, default: 2
      t.string :name, null: false

      t.timestamps
    end
  end
end
