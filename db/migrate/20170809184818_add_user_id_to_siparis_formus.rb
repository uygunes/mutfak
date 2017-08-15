class AddUserIdToSiparisFormus < ActiveRecord::Migration[5.1]
  def change
    add_column :siparis_formus, :user_id, :integer
  end
end
