require 'csv'
require './lib/load_file'
# require './lib/repl'



class Queue

  def load_data(file_name = "./data/event_attendees.csv")
    data = LoadFile.new(file_name).contents
  end
end
