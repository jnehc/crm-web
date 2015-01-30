require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'


@@rolodex = Rolodex.new  #class

# # Temporary fake data so that we always find contact with id 1000.
new_contact = Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")
@@rolodex.add_contact(new_contact)





get "/contacts/1000" do
  @contact = @@rolodex.find(1000)
  erb :show_contact
end


get "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/erasetest' do
    erb :erasetest
end

get '/' do
	  @crm_app_name = "Address Book"
	  erb :index
end

get '/index3' do
	  erb :index3
end

get '/contacts' do
	erb :contacts
end


get '/contacts/new' do
	erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(first_name, params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
   redirect to('/contacts')
end


#   ##    #
