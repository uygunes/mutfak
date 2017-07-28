class AddMekanIdToSiparisFormu < ActiveRecord::Migration[5.1]
  def change
    add_column :siparis_formus, :mekan_id, :integer
  end
end
