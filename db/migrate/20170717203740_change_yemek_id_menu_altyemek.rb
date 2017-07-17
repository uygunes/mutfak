class ChangeYemekIdMenuAltyemek < ActiveRecord::Migration[5.1]
  def change
  	rename_column :menu_altyemeks, :yemek_id, :altyemek_id
  end
end
