class AddMekanIdToMenu < ActiveRecord::Migration[5.1]
  def change
    add_column :menus, :mekan_id, :integer
  end
end
