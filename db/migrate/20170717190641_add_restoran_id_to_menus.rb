class AddRestoranIdToMenus < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :restoran_id, :integer
  end
end
