class PatternsController < ApplicationController
  def new
  	@timestamp = Date.new(2019,02,18).to_time.to_i
  end

  def show
  	response = HTTParty.get("https://api.darksky.net/forecast/#{ENV['DARK_SKY_SECRET']}/42.3601,-71.0589,255657600?exclude=currently,flags")
  end

end

