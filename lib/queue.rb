require 'csv'
require './lib/load_file'
require './lib/cleaner'
require_relative 'attendees'
require 'pry'

class Queue
include Cleaner

  attr_reader :data, :cleaner, :results
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
    data.each do |row|
      attendee = Attendees.new
      attendee.regdate       = row[:regdate]
      attendee.first_name    = Cleaner.clean_name(row[:first_name])
      attendee.last_name     = Cleaner.clean_name(row[:last_name])
      attendee.email_address = Cleaner.clean_name(row[:email_address])
      attendee.homephone     = Cleaner.clean_phone(row[:homephone])
      attendee.street        = Cleaner.clean_name(row[:street])
      attendee.city          = Cleaner.clean_name(row[:city])
      attendee.state         = Cleaner.clean_name(row[:state])
      attendee.zipcode       = Cleaner.clean_zip(row[:zipcode])
      @results << attendee
    end
  end

  def find(attribute, criteria)
    @results.each do |find|
      
    binding.pry
  end

end

q = Queue.new

q.find()
