class CreateMekanStoks < ActiveRecord::Migration[5.1]
  def change
    create_table :mekan_stoks do |t|
      t.integer :mekan_id
      t.integer :stok_id

      t.timestamps
    end
  end
end
