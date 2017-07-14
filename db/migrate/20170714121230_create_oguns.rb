class CreateOguns < ActiveRecord::Migration[5.1]
  def change
   drop_table :oguns
  end


 def up
    create_table :oguns do |t|
      t.string :isim
      t.time :baslangic
      t.time :bitis

      t.timestamps
    end
  end

def down
	drop_table :oguns
end


end
