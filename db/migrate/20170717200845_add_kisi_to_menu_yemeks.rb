class AddKisiToMenuYemeks < ActiveRecord::Migration[5.1]
  def change
    add_column :menu_yemeks, :kisi, :integer
  end
end
