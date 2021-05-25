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
    redirect '/listings'
  end

  get '/listings' do
    @listings = Listing.all
    erb(:listings)
  end
end