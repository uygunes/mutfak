class RemoveMutfakIdFromYemek < ActiveRecord::Migration[5.1]
  def change
    remove_column :yemeks, :mutfak_id, :integer
  end
end
