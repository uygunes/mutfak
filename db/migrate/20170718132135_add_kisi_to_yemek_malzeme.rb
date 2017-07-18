class AddKisiToYemekMalzeme < ActiveRecord::Migration[5.1]
  def change
    add_column :yemek_malzemes, :kisi, :integer
  end
end
