class AddMutfakIdToYemek < ActiveRecord::Migration[5.1]
  def change
    add_column :yemeks, :mutfak_id, :integer
  end
end
