class AddMalzemeKategoriIdtoMalzeme < ActiveRecord::Migration[5.1]
 def change
  	add_column :malzemes, :malzeme_kategori_id,:integer, index: true
  end
end
