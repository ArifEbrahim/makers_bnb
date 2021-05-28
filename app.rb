
require "sinatra/base"
require "sinatra/reloader"
require "./lib/listing"
require "./lib/user"
require "./lib/booking"
require 'byebug'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    set :public_folder, Proc.new { File.join(root, 'static') }
  end

  enable :sessions

  attr_reader :user

  get '/' do
    erb :index
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/listings'
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
    erb :"booking_confirmation"
  end 

  get '/listings/new' do
    erb :"listings/new"
  end

  post '/listings/create' do
    Listing.create(
      address: params[:address],
      name: params[:name],
      description: params[:description],
      price: params[:price],
      start_date: params[:start_date],
      end_date: params[:end_date]
    )
    redirect '/listings'
  end

  get '/listings/:id/book' do
    @listing = Listing.find(id: params[:id])
    @user_id = session[:user_id]
    erb(:book)
  end

  post '/booking' do
    Booking.create(
      start_date: params[:start_date],
      listing_id: params[:listing_id],
      guest_id: params[:user_id],
    )
    redirect '/booking_confirmation'
  end


  run! if app_file == $PROGRAM_NAME
end
