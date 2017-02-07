class AddControlValuesToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :control_values, :jsonb, null: false, default: '{}'
  end
end
