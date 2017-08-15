class AddMalzemeIdToTeslimatFormu < ActiveRecord::Migration[5.1]
  def change
    add_column :teslimat_formus, :malzeme_id, :integer
  end
end
