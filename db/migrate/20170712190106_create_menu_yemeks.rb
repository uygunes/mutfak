class CreateMenuYemeks < ActiveRecord::Migration[5.1]
  def change
    create_table :menu_yemeks do |t|
      t.belongs_to :menu, index: true
      t.belongs_to :yemek, index: true
      t.timestamps
    end
  end
end
