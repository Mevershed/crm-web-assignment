require 'pry'
class Contact
  attr_reader :id
  attr_accessor :first_name, :last_name, :email, :note

  @@contacts = []
  @@id = 1

  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note

    @id = @@id
    @@id += 1
  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
    @@contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(by_id)
    @@contacts.each do |contact|
      return contact if contact.id == by_id
    end

  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update(attribute, new_value)
    if attribute == 'email'
      self.email = new_value
    elsif attribute == 'first_name'
      self.first_name = new_value
    elsif attribute == 'last_name'
      self.last_name = new_value
    elsif attribute == 'email'
      self.email = new_value
    elsif attribute == 'note'
      self.note = new_value
    end
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by(attribute, value)
    @attribute = attribute
    @value = value

    @@contacts.each do |contact|
            if attribute == 'id'
                search_by = contact.id
                search_value = value.to_i
            elsif attribute == 'first_name'
                search_by = contact.first_name
                search_value = value
            elsif attribute == 'last_name'
                search_by = contact.last_name
                search_value = value
            elsif attribute == 'email'
                search_by = contact.email
                search_value = value
            elsif attribute == 'phone'
                search_by = contact.phone
                search_value = value
            elsif attribute == 'note'
                search_by = contact.note
                search_value = value
            end
            return contact if search_by == search_value
        end
        nil

  end

  # This method should delete all of the contacts
  def self.delete_all
    @@contacts = []
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@contacts.delete(self)
  end

  # Feel free to add other methods here, if you need them.

end
