class AddAltYemekIdToAltYemeks < ActiveRecord::Migration[5.1]
  def change
    add_column :alt_yemeks, :alt_yemek_id, :integer
  end
end
