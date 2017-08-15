class CreateStokTakips < ActiveRecord::Migration[5.1]
  def change
    create_table :stok_takips do |t|
      t.integer :menu_id
      t.integer :mekan_id
      t.integer :siparis_formu_id
      t.integer :teslimat_formu_id
      t.integer :malzeme_id
      t.integer :user_id
      t.float :miktar

      t.timestamps
    end
  end
end
