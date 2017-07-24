class AddMiktarToMekanStok < ActiveRecord::Migration[5.1]
  def change
    add_column :mekan_stoks, :miktar, :integer
  end
end
