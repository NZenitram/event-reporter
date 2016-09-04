require './lib/attendees'
require './lib/help_file'
require 'pry'

class Repl
  attr_reader

  def initialize

  end

  def run
    command = ""
    while command != "q"
      printf "Enter command, or type 'help' for a list of commands: "
      command = gets.chomp
    case command
      when 'q' then puts "Goodbye!"
      when 'load' then puts "Please enter file name you would like to load:"
        file_name = gets.chomp
        if file_name == ""
          LoadFile.new("./data/event_attendees.csv")
        else
          LoadFile.new "./data/#{file_name}"
        end
      when 'help' then puts "Which command would you like help with?\n\nload\n\nqueue\n\nfind\n"
        help = gets.chomp
        if help == "load"
          HelpFile.new.load_text
        elsif help == "find"
          HelpFile.new.find_text
        end


      else
        puts "Sorry, I don't know how to #{command}"
    end
    end
  end

end

repl = Repl.new

repl.run
