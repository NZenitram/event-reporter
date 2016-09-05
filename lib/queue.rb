require 'csv'
require './lib/load_file'

class Queue
  attr_reader :data
  def initialize(file_name = "./data/event_attendees.csv")
    @data = LoadFile.new(file_name).contents
  end

  def queue_input
    input = ""

    input = gets.chomp
    case input
    when 'print' then puts @data
      else
        puts "Sorry I don't have that #{input}"
    end
  end

  def iterate(name)
    attendees = data.map do |row|
      first_name = row[:first_name].downcase
        if first_name == name.downcase
          puts row
        end
    end
  end

end

q = Queue.new

q.iterate("AlLiSon")
