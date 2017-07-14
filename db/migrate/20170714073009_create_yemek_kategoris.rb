class CreateYemekKategoris < ActiveRecord::Migration[5.1]
  def change
    create_table :yemek_kategoris do |t|
      t.string :isim

      t.timestamps
    end
  end
end
