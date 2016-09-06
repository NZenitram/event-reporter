require './lib/cleaner'
require './lib/load_file'

class Attendees
  attr_reader :regdate,
              :first_name,
              # :last_name,
              # :email_address,
              # :homephone,
              # :street,
              # :city,
              # :state,
              # :zipcode

  def initialize
    @reg_date          = data[:regdate]
    @first_name        = Cleaner.clean_name(data[:first_name])
    # @last_name       = Cleaner.clean_name(data)
    # @email_address   = data
    # @home_phone      = Cleaner.clean_phone(data)
    # @street
    # @city
    # @state
    # @zipcode         = Cleaner.clean_zip(data)
  end
end
