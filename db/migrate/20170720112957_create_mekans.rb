class CreateMekans < ActiveRecord::Migration[5.1]
  def change
    create_table :mekans do |t|
      t.string :isim
      t.integer :mekan_kategori_id

      t.timestamps
    end
  end
end
