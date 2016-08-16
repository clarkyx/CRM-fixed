require_relative './contact.rb'

class CRM

  def initialize

  end

  def main_menu
    while true
      print_main_menu
      user_select = gets.chomp!.to_i
      break if user_select == 6
      call_option(user_select)
    end
  end

  def print_main_menu
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Display all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_select)
    case user_select
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then display_all_contacts
    when 5 then search_by_attribute
    end
  end

  def add_new_contact

    print 'Enter First Name: '
    first_name = gets.chomp

    print 'Enter Last Name: '
    last_name = gets.chomp

    print 'Enter Email Address: '
    email = gets.chomp

    print 'Enter a Note: '
    note = gets.chomp

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    display_all_contacts
    puts "please enter the id of the contact you want to edit"
    id = gets.chomp!.to_i
    puts "please enter the field name you want to edit"
    field = gets.chomp!
    puts "please enter the new value of the field"
    value = gets.chomp!
    Contact.find(id).update(field,value)
  end

  def delete_contact
    display_all_contacts
    puts "please enter the id of contact you want to delete"
    id = gets.chomp!.to_i
    Contact.find(id).delete
  end

  # This method should accept as an argument an array of contacts
  # and display each contact in that array
  def display_contacts(contact)
    puts "********"
    puts "id         : #{contact.id}"
    puts "first name : #{contact.first_name}"
    puts "last name  : #{contact.last_name}"
    puts "email      : #{contact.email}"
    puts "note       : #{contact.note}"
    puts "********"
    # HINT: Make use of this method in the display_all_contacts and search_by_attribute methods to keep your code DRY
  end

  def display_all_contacts
    puts '****Here are all exisiting contacts****'
    Contact.all.each do |contact|
      display_contacts(contact)
    end
    # HINT: Make use of the display_contacts method to keep your code DRY
  end

  def search_by_attribute
    puts 'please enter the field name of the contact you want to search: first_name,last_name,email,note'
    # HINT: Make use of the display_contacts method to keep your code DRY
    name = gets.chomp!
    puts 'plase enter the value of the contact you want to search'
    value = gets.chomp!
    display_contacts(Contact.find_by(name,value))
  end

  # Add other methods here, if you need them.

end

a_crm_app = CRM.new
a_crm_app.main_menu
