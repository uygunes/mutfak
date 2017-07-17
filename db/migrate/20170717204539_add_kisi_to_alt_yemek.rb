class AddKisiToAltYemek < ActiveRecord::Migration[5.1]
  def change
    add_column :alt_yemeks, :kisi, :integer
  end
end
