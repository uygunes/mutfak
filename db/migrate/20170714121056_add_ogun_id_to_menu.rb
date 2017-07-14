class AddOgunIdToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :ogun_id, :integer,index: true
  end
end
