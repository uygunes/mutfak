class ChangeMiktarDefaultMekanStok < ActiveRecord::Migration[5.1]
  def change
    change_column_default :mekan_stoks, :miktar, 0
  end
end
