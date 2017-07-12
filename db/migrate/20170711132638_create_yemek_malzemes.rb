class CreateYemekMalzemes < ActiveRecord::Migration[5.1]
  def change
    create_table :yemek_malzemes do |t|
	  t.belongs_to :malzeme, index: true
      t.belongs_to :yemek, index: true
      t.float :miktar
      t.timestamps
    end
  end
end
