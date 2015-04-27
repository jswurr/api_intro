require 'open-uri'
require 'json'

class ApiController < ApplicationController
  def weather_form
  end

  def weather_output
    address = URI.encode(params["address"])
    url = "http://api.openweathermap.org/data/2.5/weather?q=#{address}"
    initial_info = open(url).read
    parsed_info = JSON.parse(initial_info)
    @result = parsed_info["weather"][0]["description"]
    @icon = parsed_info["weather"][0]["icon"]
    temp_min = parsed_info["main"]["temp_min"]
    @temp_min = temp_min
    speed = parsed_info ["wind"]["speed"]
    @speed = speed
  end
end
