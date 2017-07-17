class AddKategoriIdToYemeks < ActiveRecord::Migration[5.1]
  def change
  	add_column :yemeks, :kategori_id, :integer, index: true
  end
end
