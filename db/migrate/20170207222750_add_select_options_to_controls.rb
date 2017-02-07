class AddSelectOptionsToControls < ActiveRecord::Migration
  def change
    add_column :controls, :select_options, :string
  end
end
