require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'open-uri'
require 'json'
require 'net/http'

require 'sinatra/activerecord'
require './models'

get '/' do
  erb :form
end

get '/list' do
  uri = URI("http://express.heartrails.com/api/json")
  uri.query = URI.encode_www_form({
    method: "getStations",
    x: params[:x],
    y: params[:y]
  })
  res = Net::HTTP.get_response(uri)
  json = JSON.parse(res.body)
  @stations = json["response"]["station"]
  erb :list
end

get '/api/station' do
  uri = URI("http://express.heartrails.com/api/json")
  uri.query = URI.encode_www_form({
    method: "getStations",
    line: params[:line],
    name: params[:name]
  })
  res = Net::HTTP.get_response(uri)
  json = JSON.parse(res.body)
  if json["response"]["error"]
    response= {error: "No Station."}
  else
    response = {
    next: json["response"]["station"][0]["next"],
    prev: json["response"]["station"][0]["prev"]
  }
  end
  json response
end