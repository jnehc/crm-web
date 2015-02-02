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
  end

  def find(id)
    @contacts.find {|contact| contact.id == contact_id }
  end


def modify_contact(id)
    contact_to_edit = find_contact(contact_id)
    puts "[1] Do you want to change the First Name?"
    puts "[2] Do you want to change the Last Name?"
    puts "[3] Do you want to change the Email?"
    puts "[4] Do you want to change the Note?"

    option = gets.chomp.to_i

    if option == 1
      puts "Please enter new First Name: "
      new_first_name = gets.chomp
      contact_to_be_modified.first_name = new_first_name

    elsif option == 2
      puts "Please enter new Last Name: "
      new_last_name = gets.chomp
      contact_to_be_modified.last_name = new_last_name

    elsif option == 3
      puts "Please enter new Email: "
      new_email = gets.chomp
      contact_to_be_modified.email = new_email

    elsif option == 4
      puts "Please enter a Note: "
      new_note = gets.chomp
      contact_to_be_modified.note = new_note      
    
    else
      puts "That isn't an option. Try again."
    end
  end

def display_all_contacts
    @contacts.each do |i|
      puts i.to_s
    end
  end


  def diplay_info_by_attribute(displayattribute)
 case displayattribute
      when "firstname" then @contacts.each { |i| puts i.first_name }
      when "lastname" then @contacts.each { |i| puts i.last_name }
      when "email" then @contacts.each { |i| puts i.email }
      when "notes" then @contacts.each { |i| puts i.notes }
      else puts "No such attribute!"  
    end
  end

def delete_contact(id)
    contact_to_be_deleted = find_contact(id)
    @contacts.delete(contact_to_be_deleted)
  end


end

