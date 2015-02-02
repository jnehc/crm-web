class Contact
  attr_accessor :id, :first_name, :last_name, :email, :note

  def initialize(first_name, last_name, email, note)
    @@ids = id
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note  
  end

  def to_s
    "id: #{@@ids} First Name: #{@first_name} Last Name: #{@last_name} Email: #{@email} Note: #{@note}" 
  end
end