require 'sinatra'
require_relative 'contact'
require_relative 'rolodex'
require 'date'


@@rolodex = Rolodex.new  #class

# # # Temporary fake data so that we always find contact with id 1000.
# new_contact = Contact.new("Johnny", "Bravo", "johnny@bitmakerlabs.com", "Rockstar")
# @@rolodex.add_contact(new_contact)

get "/contacts" do
  @contacts = []
  @contacts << Contact.new("Yehuda", "Katz", "yehuda@example.com", "Developer")
  @contacts << Contact.new("Mark", "Zuckerberg", "mark@facebook.com", "CEO")
  @contacts << Contact.new("Sergey", "Brin", "sergey@google.com", "Co-Founder")
  erb :contacts
end



# get "/contacts/1000" do
#   @contact = @@rolodex.find(1000)
#   erb :show_contact
# end
# #create a new route for view/show_contact


# get "/contacts/:id" do
#   @contact = @@rolodex.find(params[:id].to_i)
#   erb :show_contact
# end
#below is a more general version of above

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

#        Routes and PLACEHOLDERS   #

get '/' do
    @crm_app_name = "myCRM"
    erb :index
end

get '/' do
    @time = Time.new
    erb :index
end



get '/contacts' do
  erb :contacts
end


get '/contacts/new' do
  erb :new
end


get '/add_contact' do
  erb :add_contact
end


get '/edit_contact' do
  erb :edit_contact
end

get '/delete_contact' do
  erb :delete_contact
end


get "/contacts/:id/edit" do
  erb :edit_contact
end



# post '/contacts' do
#   new_contact = Contact.new(first_name, params[:last_name], params[:email], params[:note])
#   $rolodex.add_contact(new_contact)
#    redirect to('/contacts')
# end

