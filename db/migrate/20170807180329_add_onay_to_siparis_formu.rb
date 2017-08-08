class AddOnayToSiparisFormu < ActiveRecord::Migration[5.1]
  def change
    add_column :siparis_formus, :onay, :boolean,:default => false
  end
end
