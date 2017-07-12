class CreateYemeks < ActiveRecord::Migration[5.1]
  def change
    create_table :yemeks do |t|
      t.string :isim

      t.timestamps
    end
  end
end
