class Rolodex
  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end


  def find(contact_id)
    @contacts.find {|contact| contact.id == contact_id }
  end
end

# contact = @@rolodex.find(1000) now this should work from the Sinatra app