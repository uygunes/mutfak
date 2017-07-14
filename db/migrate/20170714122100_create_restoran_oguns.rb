class CreateRestoranOguns < ActiveRecord::Migration[5.1]
  def change
    create_table :restoran_oguns do |t|
      t.integer :restoran_id
      t.integer :ogun_id

      t.timestamps
    end
  end
end
