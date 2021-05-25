# frozen_string_literal: true

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
    user = User.create(email: params[:email], password: params[:password])
    session[:user_id] = user.id
    redirect '/listings'
  end

  get '/listings' do
    @user = User.find(session[:user_id])
    erb :"listings/index"
  end

  get '/book' do 
    erb(:book)
  end

  get '/booking_confirmation' do 
    "Thank you for your booking request"
  end 

  run! if app_file == $PROGRAM_NAME
end
