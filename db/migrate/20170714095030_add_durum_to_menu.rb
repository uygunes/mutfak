class AddDurumToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :is_active, :boolean
  end
end
