require_relative './rolodex'
require_relative './contact'
require 'sinatra'


# $rolodex = Rolodex.new  
#global variable to have accesss to Rolodex from anywhere in your route blocks and views

# Temporary fake data so that we always find contact with id 1000.
@@rolodex = Rolodex.new
@@rolodex.add_contact Contact.new("Yehuda", "Katz", "yehuda@example.com", "Developer")



get '/' do
    @crm_app_name = "myCRM"
    erb :index
end

#view all
get "/contacts" do
  erb :contacts
end




get '/add_contact' do
  erb :add_contact
end


get '/edit_contact' do
  erb :edit_contact
end


get '/delete_contact/:id' do
  erb :delete_contact
end

get "/contacts/:id/edit" do
  erb :edit_contact
end

get '/contacts/delete_contact' do
  erb :delete_contact
end


delete "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @@rolodex.delete_contact(@contact)
    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end


#a new version of above with 404
get "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

#404
get "/contacts/:id/edit" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

#404
#will route will handle put request /form submit
put "/contacts/:id" do
  @contact = @@rolodex.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    redirect to("/contacts")
  else
    raise Sinatra::NotFound
  end
end

# view one contact
get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
  $rolodex.add_contact(new_contact)
    redirect to('/contacts')
end
