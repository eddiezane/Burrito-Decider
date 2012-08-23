require 'sinatra'
require 'slim'

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  @places = ["Baja Fresh Mexican Grill", "Qdoba Mexican Grill", "El Limon", 
          "Chipotle Mexican Grill", "Machismo Burrito Bar"]
  @place = @places.sample
  slim :hello
end
