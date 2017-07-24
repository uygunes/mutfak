class AddMekanIdToUser < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :mekan_id, :integer
  end
end
