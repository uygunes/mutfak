class CreateMekanKategoris < ActiveRecord::Migration[5.1]
  def change
  	drop_table :mekan_kategoris
    create_table :mekan_kategoris do |t|
      t.string :isim

      t.timestamps
    end
  end
end
