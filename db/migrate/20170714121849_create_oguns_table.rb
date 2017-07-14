class CreateOgunsTable < ActiveRecord::Migration[5.1]
  def change
     create_table :oguns do |t|
      t.string :isim
      t.time :baslangic
      t.time :bitis

      t.timestamps
    end
  end
end
