require 'sinatra'
# sinatra contrib packages
require 'sinatra/contrib'
# ActiveRecord for sinatra
require 'sinatra/activerecord'
# module for authentication
require 'warden'

# require models, routes files
require_relative 'app/init'
require_relative 'models/init'
require_relative 'config/init'
require_relative 'helpers/init'