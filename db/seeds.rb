# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'




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