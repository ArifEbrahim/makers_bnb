
require "sinatra/base"
require "sinatra/reloader"
require "./lib/listing"
require "./lib/user"
require 'byebug'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

enable :sessions

attr_reader :user

  get '/' do
    erb :"index"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect "/listings"
  end

  get '/listings' do
    @user = User.find(session[:user_id]) if session[:user_id]
    @listings = Listing.all
    erb :"listings/index"
  end


  get '/book' do 
    erb(:book)
  end

  get '/booking_confirmation' do 
    "Thank you for your booking request"
  end 

  get '/listings/new' do
    erb :"listings/new"
  end

  post '/listings/create' do
    Listing.create(
      address: params[:address], 
      name: params[:name], 
      description: params[:description], 
      price: params[:price])
    redirect "/listings"
  end


  run! if app_file == $PROGRAM_NAME
end
