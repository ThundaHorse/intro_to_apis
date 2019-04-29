require 'http' 

system "clear" 
puts "Welcome to the Weather App!" 
puts "_" * 50 
puts ""

print "Enter a City: " 
city = gets.chomp 

response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?q=#{ city }&units=imperial&appid=ad55a020f8382071e966f69d41d2a5a9") 

weather_data = response.parse 

temperature = weather_data['main']['temp']
low_temp = weather_data['main']['temp_min']
high_temp = weather_data['main']['temp_max'] 
description = weather_data['weather'][0]['description']

puts "" 
puts "Today in #{ city }, it is currently #{temperature} degrees and with #{description} weather." 
puts "You can expect a high of #{high_temp} and a low of #{low_temp}." 
puts "" 