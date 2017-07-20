class AddMekanIdToYemek < ActiveRecord::Migration[5.1]
  def change
    add_column :yemeks, :mekan_id, :integer
  end
end
