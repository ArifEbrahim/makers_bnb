
require "sinatra/base"
require "sinatra/reloader"
require "./lib/listing"




class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  
  get '/listings/new' do
    erb(:listing_new)
  end

  post '/listings/create' do
    Listing.create(address: params[:address])


  get '/' do
    'Hello World'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id

    redirect '/listings'
  end

  get '/listings' do

    @listings = Listing.all
    erb(:listings)
  end
end

    @user = User.find(session[:user_id])
    erb :"listings/index"
  end

  run! if app_file == $PROGRAM_NAME
end
