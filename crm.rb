require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

get '/' do
  @crm_app_name = "Angel's CRM"
  erb :index
end

