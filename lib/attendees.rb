require 'csv'
require 'table_print'

class Attendees


  def initialize
  end
  #
  # def get_row
  #   contents.map do |row|
  #     first_name = row[:first_name]
  #     last_name  = row[:last_name]
  #
  #   end
  # end


  def contents
    contents = CSV.read "./data/event_attendees.csv", headers: true, header_converters: :symbol
    puts contents
  end

  def content_formatting
  end

end
