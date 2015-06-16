require_relative 'contact'
require_relative 'rolodex'
require 'sinatra'

$rolodex= Rolodex.new

# Routes
get '/' do
  @crm_app_name = "Angel's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
  redirect to('/contacts')
end

  # @contacts = []
  # @contacts << Contact.new("Angel", "Lopez", "angel@lopez.com", "The awesomest")
  # @contacts << Contact.new("Bob", "Roberts", "bob@bob.com", "Robert squared")
  # @contacts << Contact.new("Nick", "Jonas", "the@cutest.com", "The cutest")
  # @contacts << Contact.new("Joe", "Fresh", "joe@fashion.com", "So fresh and clean")
  # @contacts << Contact.new("Michael", "Angelo", "blue@turtle.com", "Ninja master")
  # @contacts << Contact.new("Donna", "Tello", "orange@turtle.com", "Fave is pepperoni")
  # @contacts << Contact.new("Raph", "Phael", "red@turtle.com", "Likes pointy things")
  # @contacts << Contact.new("Leo", "Nardo", "purple@turtle.com", "Best friend is a rat")
