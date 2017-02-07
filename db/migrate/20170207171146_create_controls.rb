class CreateControls < ActiveRecord::Migration
  def change
    create_table :controls do |t|
      t.string :name
      t.string :control_type
      t.references :device_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
