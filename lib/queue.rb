require 'csv'
require 'json'
require 'open-uri'
require 'erb'
require './lib/load_file'
require './lib/cleaner'
require './lib/attendee'

class Queue
  include Cleaner

  attr_reader :data, :results
  def initialize(file_name = "./data/full_event_attendees.csv")
    @data = LoadFile.new(file_name).contents
  end

  def cleaned_data
      data.map do |row|
        Attendee.new(row)
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
    district_replacement if @queued_attendees.length < 11
    puts "LAST NAME".ljust(15) + "FIRST NAME".ljust(15) + "EMAIL".ljust(45) + "PHONE".ljust(15) + "STREET".ljust(45) + "CITY".ljust(37) + "STATE".ljust(10) + "ZIPCODE".ljust(15)
    queued.map do |row|
      attendees = row.last_name.capitalize.ljust(15) + row.first_name.capitalize.ljust(15) + row.email_address.ljust(45) + row.homephone.ljust(15) + row.street.upcase.ljust(45) + row.city.capitalize.ljust(37) + row.state.upcase.ljust(10) + row.zipcode.ljust(15) + row.district
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

  # def save_html
  #   Dir.mkdir("output") unless Dir.exists? "output"
  #   template_letter = File.read "./data/form_letter.erb"
  #   erb_template = ERB.new template_letter
  #   form_letter = erb_template.result(binding)
  # end

  def district_replacement
    @queued_attendees.each do |att|
      url = "https://congress.api.sunlightfoundation.com/districts/locate?zip=#{att.zipcode}&apikey=e179a6973728c4dd3fb1204283aaccb5"
      data = JSON.parse(open(url).read)
      att.district = data["results"].first["district"].to_s
    end
  end
end
#
q = Queue.new
