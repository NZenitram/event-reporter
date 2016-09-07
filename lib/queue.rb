require 'csv'
require './lib/load_file'
require './lib/cleaner'
require './lib/attendees'
require 'pry'

class Queue
  include Cleaner

  attr_reader :data, :results
  def initialize(file_name = "./data/full_event_attendees.csv")
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

  def cleaned_data
      data.map do |row|
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
      attendee
    end
  # people
  end


  def queue(attribute = nil, criteria = nil)
    @queued_attendees = []
    cleaned_data.each do |attendee|
      if attendee.send(attribute) == criteria
        @queued_attendees << attendee
      end
    end
    @queued_attendees
  end

  def count
    if @queued_attendees == nil
      @queued_attendees = 0
    else
      @queued_attendees.count
    end
  end

  def clear
    @queued_attendees.clear
  end

  def prints
    @queued_attendees.each do |prints|
      
  end


end
#
q = Queue.new


q.queue("first_name", "sarah")

q.prints
