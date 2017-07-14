class CreateRestorans < ActiveRecord::Migration[5.1]
  def change
    create_table :restorans do |t|
      t.string :isim
      t.integer :kisi

      t.timestamps
    end
  end
end
