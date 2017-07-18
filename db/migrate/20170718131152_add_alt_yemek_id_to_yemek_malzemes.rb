class AddAltYemekIdToYemekMalzemes < ActiveRecord::Migration[5.1]
  def change
    add_column :yemek_malzemes, :alt_yemek_id, :integer
  end
end
