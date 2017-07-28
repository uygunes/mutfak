class CreateSiparisFormus < ActiveRecord::Migration[5.1]
  def change
    create_table :siparis_formus do |t|
      t.integer :malzeme_id
      t.float :miktar
      t.integer :menu_id

      t.timestamps
    end
  end
end
