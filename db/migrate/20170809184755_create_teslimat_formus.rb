class CreateTeslimatFormus < ActiveRecord::Migration[5.1]
  def change
    create_table :teslimat_formus do |t|
      t.integer :siparis_formu_id
      t.integer :mekan_id
      t.float :miktar
      t.integer :user_id

      t.timestamps
    end
  end
end
