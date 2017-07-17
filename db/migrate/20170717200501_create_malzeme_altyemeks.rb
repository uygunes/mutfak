class CreateMalzemeAltyemeks < ActiveRecord::Migration[5.1]
  def change
    create_table :malzeme_altyemeks do |t|
	  t.belongs_to :malzeme, index: true
      t.belongs_to :alt_yemek, index: true
      t.float :miktar
      t.timestamps
    end
  end
end
