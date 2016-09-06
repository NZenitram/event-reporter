
require './lib/load_file'
require './lib/help_file'
require './lib/queue'
require 'pry'

class Repl
  attr_reader :queue
  def initialize
    @queue = Queue
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
          printf "#{HelpFile.new.queue_text}"
          loaded = Queue.new
            loaded.queue_input
        else
          full_file_name = "./data/#{(file_name)}"
          Queue.new(full_file_name)
        end
      when 'help' then puts "Which command would you like help with?\n\nload\n\nqueue\n\nfind"
        help = gets.chomp
        if help == "load"
          HelpFile.new.load_text
        elsif help == "find"
          HelpFile.new.find_text
        elsif help == "queue"
          HelpFile.new.queue_text
        end
      else
        puts "Sorry, I don't know how to #{command}"
    end
    end
  end

end

repl = Repl.new

repl.run
