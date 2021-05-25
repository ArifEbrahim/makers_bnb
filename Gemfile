# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) {|repo_name| "https://github.com/#{repo_name}" }

# gem "rails"

# gem 'rspec'
# gem 'capybara'
# gem 'sinatra'
# gem 'sinatra-contrib'

 group :test do
   gem 'capybara'
#    gem 'cucumber'
   gem 'rspec'
   gem 'rubocop', '0.79.0'
   gem 'simplecov', require: false
   gem 'simplecov-console', require: false
 end

 group :development do
   gem 'bcrypt'
   gem 'byebug'
   gem 'pg'
#    gem 'pry'
   gem 'rack'
   gem 'rake'
   gem 'sinatra'
#    gem 'sinatra-activerecord'
   gem 'sinatra-contrib'
#    gem 'sinatra-flash'
   gem 'webrick'
 end
