require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

get '/' do
  erb :index
end