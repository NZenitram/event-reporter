require 'csv'
require './lib/load_file'
require './lib/cleaner'
require 'pry'

class Queue
include Cleaner

  attr_reader :data, :cleaner
  def initialize(file_name = "./data/event_attendees.csv")
    @data = LoadFile.new(file_name).contents
    @results = []
  end

  def queue_input
    input = ""

    input = gets.chomp
    case input
    when 'find'
      input
    when 'queue count' then puts @results.count
    when 'print' then puts @data
      else
        puts "Sorry I don't have that #{input}"
    end
  end

  def iterate
    attendees = data.map do |row|
      zipcode = Cleaner.clean_zip(row[:zipcode])
      first_name = Cleaner.clean_name(row[:first_name])
      last_name = Cleaner.clean_name(row[:last_name])
      regdate = row[:regdate]
      email_address = row[:email_address]
      homephone = Cleaner.clean_phone(row[:homephone])
      street = Cleaner.clean_name(row[:street])
      city  = Cleaner.clean_name(row[:city])
      state = Cleaner.clean_name(row[:state])
      zipcode = Cleaner.clean_zip(row[:zipcode])

      puts "#{regdate} #{first_name} #{last_name} #{zipcode} #{email_address} #{homephone} #{street} #{city} #{state} #{zipcode}"
    end
  end

  def search(name)
    name = Cleaner.clean_name(name)
    search_criteria =  { :first_name => name}
    matches = data.find_all do |row|
      match = true
      search_criteria.keys.each do |key|
        match = row[key] == search_criteria[key]
        case match
        when true
          @results << row
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

q.iterate
