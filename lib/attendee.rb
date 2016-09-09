require './lib/cleaner'
require './lib/load_file'

class Attendee
  include Cleaner
  attr_accessor :regdate,
                :first_name,
                :last_name,
                :email_address,
                :homephone,
                :street,
                :city,
                :state,
                :zipcode,
                :district

  def initialize(row)
    @regdate       = row[:regdate]
    @first_name    = Cleaner.clean_name(row[:first_name])
    @last_name     = Cleaner.clean_name(row[:last_name])
    @email_address = Cleaner.clean_name(row[:email_address])
    @homephone     = Cleaner.clean_phone(row[:homephone])
    @street        = Cleaner.clean_name(row[:street])
    @city          = Cleaner.clean_name(row[:city])
    @state         = Cleaner.clean_name(row[:state])
    @zipcode       = Cleaner.clean_zip(row[:zipcode])
    @district      = ""

  end
end
