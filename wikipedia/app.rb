require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'net/http'
require 'uri'

get '/:keyword' do
  base_url = 'http://wikipedia.simpleapi.net/api?output=html&keyword='
  keyword = params[:keyword]
  url = URI.parse(base_url+keyword)
  Net::HTTP.get(url)
end
