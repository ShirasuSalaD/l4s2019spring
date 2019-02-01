require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

get '/' do
  '<img src = "http://capture.heartrails.com/?http://life-is-tech.com">'
end