class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string :city_ascii
      t.string :country

      t.timestamps
    end

    add_column :cities, :lat, :decimal, precision: 7, scale: 4
    add_column :cities, :lng, :decimal, precision: 7, scale: 4
  end
end
