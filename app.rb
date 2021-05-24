require "sinatra/base"
require "sinatra/reloader"

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  
  get '/listings/new' do
    erb(:listing_new)
  end

  post '/listings/create' do
    $listing = params[:address]
    redirect '/listings'
  end

  get '/listings' do
    @listing = $listing
    erb(:listings)
  end
end