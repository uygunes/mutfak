class AddKategoriIdToMalzemes < ActiveRecord::Migration[5.1]
  def change
    add_column :malzemes, :kategori_id, :integer, index: true
  end
end
