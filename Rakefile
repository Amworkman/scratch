ENV["SINATRA_ENV"] ||= "development"

require "bundler/gem_tasks"
task :default => :spec

require_relative './config/environment'
require 'sinatra/activerecord/rake'
require './app/controllers/application_controller'

task :console do
  Pry.start
end
