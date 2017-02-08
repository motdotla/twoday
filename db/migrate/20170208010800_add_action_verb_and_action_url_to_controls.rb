class AddActionVerbAndActionUrlToControls < ActiveRecord::Migration
  def change
    add_column :controls, :action_verb, :string
    add_column :controls, :action_url, :text
  end
end
