require 'sinatra'

class Contact
  attr_accessor :id, :first_name, :last_name, :email, :note
	#give each contact a unique id for tracking, make it read only

  def initialize(first_name, last_name, email, note)
    # binding.pry
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
  end

  def to_s 
		"id: #{@id}notes, First Name: #{@first_name}, Last Name: #{@last_name}, Email: #{@email}, Notes: #{@notes}"
	end
	#to_s same as calling class.to_s and printing to terminal
end