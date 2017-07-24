class AddMiktarToStok < ActiveRecord::Migration[5.1]
  def change
    add_column :stoks, :miktar, :integer
  end
end
