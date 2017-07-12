class CreateMalzemes < ActiveRecord::Migration[5.1]
  def change
    create_table :malzemes do |t|
      t.string :isim
      t.integer :birim_id
      t.float :fiyat
      t.integer :tedarikci_id

      t.timestamps
    end
    add_index :malzemes, :birim_id
    add_index :malzemes, :tedarikci_id
  end
end
