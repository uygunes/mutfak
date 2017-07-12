class CreateBirims < ActiveRecord::Migration[5.1]
  def change
    create_table :birims do |t|
      t.string :isim

      t.timestamps
    end
  end
end
