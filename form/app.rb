require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require 'sinatra/activerecord'
require './models'

get '/' do
  erb :index
end

post '/answers' do
  Answer.create(
    name: params[:name],
    age: params[:age],
    gender: params[:gender],
    grade: params[:grade],
    email: params[:email],
    password: params[:password],
    date: params[:date],
    content: params[:content]
  )
  redirect '/'
end

get '/answers' do
  @answers =Answer.all
  erb :answers
end