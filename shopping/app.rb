require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models.rb'

enable :sessions

get '/' do
  erb :index
end

get '/signup' do
  erb :signup
end

get '/signin' do
  erb :signin
end

post '/signup' do
  @user = User.create(name: params[:name], email: params[:email], password: params[:password],
                      password_confirmation: params[:password_confirmation])
  if @user != nil
    session[:user]=@user.id
  end
  redirect '/'
end

post '/signin' do
  user = User.find_by(email :params[:email])
  if user && user.authenticate(params[:password])
    session[:user] = user.id
  end
  redirect '/'
end

get '/signout' do
  session[:user] = nil
  redirect '/'
end

post '/add_item' do
  @item = Item.create(name: params[:name], price: params[:price], category_id: params[:category], image_url: params[:image_url])
  redirect '/'
end

post '/add_to_cart' do
  cart = Cart.find(params[:cart_id])
  item = Item.find(params[:item_id])
  cart.items << item
  redirect '/my_cart'
end

post '/delete/:id' do
  CartItem.find(params[:id]).delete
  redirect '/my_cart'
end

get '/category/:id' do
  @category      = Category.find(params[:id])
  erb :category
end

get '/create_cart' do
  erb :create_cart
end

post '/create_cart' do
  @create_cart = Cart.create
  redirect '/create_cart'
end

get '/admin' do
  erb :admin
end

get '/my_cart' do
  erb :my_cart
end
