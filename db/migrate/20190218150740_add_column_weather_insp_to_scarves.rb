class AddColumnWeatherInspToScarves < ActiveRecord::Migration[5.2]
  def change
  	add_column :scarves, :weather_insp, :integer
  end
end
