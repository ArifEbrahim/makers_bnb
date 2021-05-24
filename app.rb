require 'sinatra/base'
require 'sinatra/reloader'

class MakersBnB < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end

  get '/' do
    'Hello World'
  end

  get '/users/new' do
    erb :"users/new"
  end

  post '/users' do
    User.create(email: params[:email], password: params[:password])
    redirect '/listings'
  end 

  run! if app_file == $0
end