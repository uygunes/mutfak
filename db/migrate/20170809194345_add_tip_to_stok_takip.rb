class AddTipToStokTakip < ActiveRecord::Migration[5.1]
  def change
    add_column :stok_takips, :tip, :string
  end
end
