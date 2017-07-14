class AddYemekKategoriIdtoYemeks < ActiveRecord::Migration[5.1]
 def change
  	add_column :yemeks, :yemek_kategori_id,:integer, index: true
  end
end
