class CreateScarves < ActiveRecord::Migration[5.2]
  def change
    create_table :scarves do |t|
      t.string :title
      t.string :description
      t.integer :city_insp
      t.datetime :date_insp

      t.timestamps
    end

    add_column :scarves, :pattern, :text, array: true, default: []
  end
end
