class AddTipToYemekUretim < ActiveRecord::Migration[5.1]
  def change
    add_column :yemek_uretims, :tip, :string
  end
end
