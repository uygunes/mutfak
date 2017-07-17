class CreateYemekAltyemeks < ActiveRecord::Migration[5.1]
  def change
    create_table :yemek_altyemeks do |t|
      t.integer :yemek_id
      t.integer :alt_yemek_id

      t.timestamps
    end
  end
end
