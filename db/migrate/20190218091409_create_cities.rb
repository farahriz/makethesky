class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city_name
      t.string :city_ascii
      t.string :country

      t.timestamps
    end

    add_column :cities, :lat, :float
    add_column :cities, :lng, :float
  end
end
