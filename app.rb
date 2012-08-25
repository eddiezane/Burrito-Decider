require 'sinatra'
require 'slim'
require 'foursquare2'

class BurritoFinder
  def self.find_burrito(zip)
    client.search_venues(:near => zip, :radius => '8000', :query => 'burrito', :verified => true).groups.first.items.sample
  end

  def self.client
    @client ||= Foursquare2::Client.new(:client_id => ENV['FOURSQUARE_ID'], 
                                        :client_secret => ENV['FOURSQUARE_SECRET'])
  end
end

#Capitalize first letter of each word
def titleize(text)
  text.split.each{|i| i.capitalize!}.join(' ')
end

configure do
  set :public_folder, Proc.new { File.join(root, "static") }
end

get '/' do
  slim :hello
end

get '/zip' do
  place = BurritoFinder.find_burrito params[:zip]
  @name = titleize place.name
  @address = titleize place.location.address unless place.location.address.nil?
  @city = titleize place.location.city unless place.location.city.nil?
  @phone = place.contact.phone unless place.contact.phone.nil?
  slim :zip
end
