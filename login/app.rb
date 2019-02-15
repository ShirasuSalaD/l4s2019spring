require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models'

enable :sessions

# get '/' do
#   session[:test]
# end

# get '/input' do
#   session[:test]="Hello Gahaku!"
# end

get '/' do
  erb:index
end

get '/signin' do
  erb:sign_in
end

post '/signin' do
  user=User.find_by(mail:params[:mail])
  if user&&user.authenticate(params[:password])
    session[:user]=user.id
  end
  redirect '/'
end

get '/signup' do
  erb:sign_up
end

post '/signup' do
  @user=User.create(mail:params[:mail],password:params[:password],password_confirmation:params[:password_confirmation])
  if @user.persisted?
    session[:user]=@user.id
  end
  redirect '/'
end

get '/signout' do
  session[:user]=nil
  redirect '/'
end