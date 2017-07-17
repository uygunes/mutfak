class AddKisiToYemekAltyemek < ActiveRecord::Migration[5.1]
  def change
    add_column :yemek_altyemeks, :kisi, :integer
  end
end
