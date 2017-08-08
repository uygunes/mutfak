class CreateYemekUretims < ActiveRecord::Migration[5.1]
  def change
    create_table :yemek_uretims do |t|
      t.integer :yemek_id
      t.integer :mekan_id
      t.integer :menu_id
      t.float :miktar
      t.integer :birim_id

      t.timestamps
    end
  end
end
