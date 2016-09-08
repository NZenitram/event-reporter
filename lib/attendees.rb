require './lib/cleaner'
require './lib/load_file'

class Attendees
  attr_accessor :regdate,
                :first_name,
                :last_name,
                :email_address,
                :homephone,
                :street,
                :city,
                :state,
                :zipcode
end
