class CreateMekanOguns < ActiveRecord::Migration[5.1]
  def change
    create_table :mekan_oguns do |t|
      t.integer :mekan_id
      t.integer :ogun_id

      t.timestamps
    end
  end
end
