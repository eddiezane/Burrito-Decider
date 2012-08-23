require 'sinatra'
require 'slim'

get '/' do
  @places = ["Baja Fresh Mexican Grill", "Qdoba Mexican Grill", "El Limon", 
          "Chipotle Mexican Grill", "Machismo Burrito Bar"]
  slim :hello
end
