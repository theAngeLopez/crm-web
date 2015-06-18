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

put '/contacts/:id' do
  @edit_contact = $rolodex.find(params[:id].to_i)
    if @edit_contact
      @edit_contact.first_name = params[:first_name]
      @edit_contact.last_name = params[:last_name]
      @edit_contact.email = params[:email]
      @edit_contact.note = params[:note]

      redirect to('/contacts')
    else
      raise Sinatra::NotFound
    end
end

delete '/contacts/:id' do
  @delete_contact = $rolodex.find(params[:id].to_i)
    if @delete_contact
      $rolodex.remove_contact(@delete_contact)
      redirect to ('/contacts')
    else
      raise Sinatra::NotFound
    end
end















