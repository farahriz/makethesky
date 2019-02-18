require 'csv'


# Seed cities and thier lat/long
ActiveRecord::Base.transaction do
	csv_text = File.read(Rails.root.join('lib', 'seeds', 'worldcities.csv'))
	csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')

	csv.each do |row|
	  c = City.new
	  c.city_name = row['city']
	  c.city_ascii = row['city_ascii']
	  c.country = row['country']
	  c.lat = row['lat']
	  c.lng = row['lng']
	  c.save
	end
end