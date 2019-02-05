require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'open-uri'
require 'json'
require 'net/http'

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