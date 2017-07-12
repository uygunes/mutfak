class CreateMenus < ActiveRecord::Migration[5.1]
  def change
    create_table :menus do |t|
      t.string :isim
      t.date :tarih

      t.timestamps
    end
  end
end
