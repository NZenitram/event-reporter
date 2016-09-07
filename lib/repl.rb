
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
    while command != "quit"
      printf "Enter command, or type 'help' for a list of commands: "
      command = gets.chomp.split(" ")
    case command[0]
    when 'quit' then abort
      when 'load'
        if command[1] == nil
          @loaded = Queue.new
        else
          full_file_name = "./data/#{command[1]}"
          @loaded = Queue.new(full_file_name)
        end
      when 'find'
        # binding.pry
        @loaded.queue(command[1], command[2])
      when 'queue'
        if command[1] == nil
          HelpFile.new.queue_text
        elsif
          command[1] == "count"
          puts @loaded.count
        elsif
          command[1] == "clear"
          @loaded.clear
        elsif
          command[1] == "print"
          @loaded.print
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
