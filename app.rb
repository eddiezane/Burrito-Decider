require 'sinatra'

places = ["Baja Fresh Mexican Grill", "Qdoba Mexican Grill", "El Limon", 
          "Chipotle Mexican Grill", "Machismo Burrito Bar"]

get '/' do
  places[rand(places.length)]
end
