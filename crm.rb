require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex= Rolodex.new
@@crm_app_name = "My Best Friends Manager"

# Routes
get '/' do
  erb :home
end

get '/contacts' do
  erb :contacts
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

get '/contacts/new' do
  erb :new_contact
end

get '/find' do
  puts "Workin' on it"
end

get '/contacts/:id' do
  @show_contact = $rolodex.find(params[:id].to_i)
    if @show_contact
      erb :show_contact
    else
      raise Sinatra::NotFound
    end
end

get '/contacts/:id/edit' do
  @edit_contact = $rolodex.find(params[:id].to_i)
    if @edit_contact
      erb :edit_contact
    else
      raise Sinatra::NotFound
    end
end



