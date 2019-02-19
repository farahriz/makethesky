class AddUserKeyToScarves < ActiveRecord::Migration[5.2]
  def change
  	add_column :scarves, :user_id, :integer
  	add_foreign_key :scarves, :users
  end
end
