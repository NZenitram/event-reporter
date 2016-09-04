require 'csv'

class LoadFile
  attr_reader :contents

  def initialize(file_name = "./data/event_attendees.csv" )
    @contents = CSV.read (file_name), headers: true, header_converters: :symbol
  end




end

a = LoadFile.new("./data/full_event_attendees.csv")
