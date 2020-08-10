ENV['SINATRA_ENV'] ||= "development"

require 'bundler/setup'
require 'dotenv/load'
Bundler.require(:default, ENV['SINATRA_ENV'])
require 'sinatra'



ActiveRecord::Base.establish_connection( ENV['DATABASE_URL'] || {
  adapter: "sqlite3",
  database: "db/#{ENV['SINATRA_ENV']}.sqlite"
})

require_all 'app'