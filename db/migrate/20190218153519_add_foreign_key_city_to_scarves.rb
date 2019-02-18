class AddForeignKeyCityToScarves < ActiveRecord::Migration[5.2]
  def change
  	add_foreign_key :scarves, :cities


  end
end
