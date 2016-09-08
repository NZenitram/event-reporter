require 'csv'
require 'json'
require 'open-uri'
require './lib/load_file'
require './lib/cleaner'
require './lib/attendees'
require 'pry'

class Queue
  include Cleaner

  attr_reader :data, :results
  def initialize(file_name = "./data/full_event_attendees.csv")
    @data = LoadFile.new(file_name).contents
  end

  # def queue_input
  #   input = ""
  #
  #   input = gets.chomp
  #   case input
  #   when 'find'
  #     input
  #   when 'queue count' then puts @results.count
  #   when 'print' then puts @data
  #     else
  #       puts "Sorry I don't have that #{input}"
  #   end
  # end

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
    if @queued_attendees == nil
      return
    else
      @queued_attendees.clear
    end
  end

  def prints(queued = @queued_attendees)
    queued.map do |row|
      attendees = row.regdate.ljust(15) + row.first_name.capitalize.ljust(15) + row.last_name.capitalize.ljust(15) + row.email_address.ljust(45) + row.homephone.ljust(15) + row.street.upcase.ljust(45) + row.city.capitalize.ljust(37) + row.state.upcase.ljust(10) + row.zipcode.ljust(15)
      puts attendees
    end
  end

  def print_by(attribute)
    @alpha_sort = @queued_attendees.sort_by {|att| att.send(attribute)}
      prints(@alpha_sort)

  end

  def save_to(file_name)
    file = []
    CSV.open("./data/#{file_name}", "w") do |file|
      file << ["regdate", "first_name", "last_name", "email_address", "homephone", "street", "city", "state", "zipcode"]
      @queued_attendees.each do |pop|
        file << [pop.regdate, pop.first_name.capitalize, pop.last_name.capitalize, pop.email_address, pop.homephone, pop.street.upcase, pop.city.capitalize, pop.state.capitalize, pop.zipcode]
      end
    end
  end

  def district_replacement(zipcode)
      url = "https://congress.api.sunlightfoundation.com/districts/locate?zip=#{zipcode}&apikey=e179a6973728c4dd3fb1204283aaccb5"
      data = JSON.parse(open(url).read)
      puts data
  end
end
#
q = Queue.new


# q.queue("first_name", "john")
#
# q.district_replacement("85745")
