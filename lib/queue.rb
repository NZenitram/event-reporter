require 'csv'
require './lib/load_file'
require './lib/cleaner'
require 'pry'

class Queue
include Cleaner

  attr_reader :data, :cleaner
  def initialize(file_name = "./data/event_attendees.csv")
    @data = LoadFile.new(file_name).contents
    # @cleaner = Cleaner.new
    @results = []
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

  # def iterate(name)
  #   attendees = data.map do |row|
  #     zipcode = cleaner.clean_zip(row[:zipcode])
  #
  #     name = cleaner.clean_name(row[:first_name])
  #
  #     puts "#{name} #{zipcode}"
  #   end
  # end
  def search
    search_criteria =  { :first_name => 'Sarah'}
    matches = data.find_all do |row|
      match = true
      search_criteria.keys.each do |key|
        match = row[key] == search_criteria[key]
        case match
        when true
           puts row
        end
      end
    end
  end
# def tests(num)
#   Cleaner.clean_phone(num)
# end

end

q = Queue.new
