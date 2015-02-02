class Rolodex
  attr_reader :contacts

@@ids=1000 #leave as global?

  def initialize
    @contacts = []
   #@id = 1000
  end

  def add_contact(contact)
    contact.id = @@ids
    @contacts << contact
    @@ids += 1
    contact
  end

#should return the first match for the block
  def find(contact_id)
    @contacts.find {|contact| contact.id == contact_id }
  end


#finish
def modify_contact(contact_id)
end

def display_all_contacts
end

def find_contact(id)
  end

  def diplay_by_attribute(attribute)
  end

  def delete_contact(id)
end
end

