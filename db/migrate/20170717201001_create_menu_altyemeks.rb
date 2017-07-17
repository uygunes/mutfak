class CreateMenuAltyemeks < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_altyemeks do |t|
	  t.belongs_to :menu, index: true
      t.belongs_to :yemek, index: true
      t.integer :kisi
      t.timestamps
      t.timestamps
    end
  end
end
