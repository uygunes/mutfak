class AddMenuIdToTeslimatFormu < ActiveRecord::Migration[5.1]
  def change
    add_column :teslimat_formus, :menu_id, :integer
  end
end
