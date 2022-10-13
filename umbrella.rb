p "Where are you located?"
user_location = gets.chomp
p user_location


require "open-uri"

gmaps_api_endpoint = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=AIzaSyAgRzRHJZf-uoevSnYDTf08or8QFS_fb3U"

raw_data=URI.open(gmaps_api_endpoint).read

p raw_data

require "json"

parsed_data = JSON.parse(raw_data)

results_array = parsed_data.fetch("results")

frist_result = results_array.at(0)

geo = frist_result.fetch("geometry")

loc= geo.fetch("location") 

latitude = loc.fetch("lat")
longitude = loc.fetch("lng")

p latitude
p longitude

# Use latitude and longitude to compose the correct 
# endpoint in the Dark Sky API
# print the current temperature
darksky = "https://api.darksky.net/forecast/26f63e92c5006b5c493906e7953da893/#{latitude},#{longitude}"

darksky_data = URI.open(darksky).read
darksky_parsed= JSON.parse(darksky_data)

darksky_results= darksky_parsed.fetch("currently")

temp = darksky_results.fetch("temperature")

p temp
