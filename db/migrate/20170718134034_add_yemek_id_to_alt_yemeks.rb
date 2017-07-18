class AddYemekIdToAltYemeks < ActiveRecord::Migration[5.1]
  def change
    add_column :alt_yemeks, :yemek_id, :integer
  end
end
