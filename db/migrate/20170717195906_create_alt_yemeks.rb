class CreateAltYemeks < ActiveRecord::Migration[5.1]
  def change
    create_table :alt_yemeks do |t|
      t.string :isim
      t.integer :yemek_kategori_id

      t.timestamps
    end
  end
end
