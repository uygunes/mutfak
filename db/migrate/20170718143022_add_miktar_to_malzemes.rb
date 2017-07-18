class AddMiktarToMalzemes < ActiveRecord::Migration[5.1]
  def change
    add_column :malzemes, :miktar, :float
  end
end
