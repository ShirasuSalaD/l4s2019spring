require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models'

get '/' do
  @posts = Post.order(updated_at: :desc)

  erb :index
end

post '/posts' do
  Post.create(title: params[:title], body: params[:body])
  redirect '/'
end

post '/posts/:id/comment' do
  post = Post.find(params[:id])
  post.comments.create(body: params[:comment])
  binding.pry
  redirect '/'
end