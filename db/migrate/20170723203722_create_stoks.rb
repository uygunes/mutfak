class CreateStoks < ActiveRecord::Migration[5.1]
  def change
    create_table :stoks do |t|
      t.integer :malzeme_id
      t.timestamps
    end
  end
end
