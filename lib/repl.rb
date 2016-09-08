
require './lib/load_file'
require './lib/help_file'
require './lib/queue'
require 'pry'

class Repl
  attr_reader :queue
  def initialize
    @queue = Queue.new
    @help = HelpFile.new
  end

  def run
    line = '--------------------------------'
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
        if @loaded == nil
          @loaded.to_s
        elsif
        @loaded.queue(command[1], command[2..-1].join(" ").downcase)
        end
      when 'queue'
        if command[1] == nil
          @help.queue_text
        elsif
          command[1] == "count"
          if @loaded == nil
          puts 0
          elsif
            puts @loaded.count
          end
        elsif
          command[1] == "clear"
          if @loaded == nil
            @loaded.to_s
          elsif
            @loaded.clear
          end
        elsif
          command[1] == "print"
          @loaded.prints
        elsif
          command[1] == "save"
          if @loaded == nil
            @loaded.to_s
          elsif
          @loaded.save_to(command[3])
          end
        end
      when 'help'
        if command[1] == nil
           puts "Which command would you like help with?\n\nload\n\nqueue count/print\n\nfind"
        elsif
          command[1] + command[2] == "queuecount"
            @help.queue_count
        else
          command[1] + command[2] == "queueprint"
            @help.queue_print
        end
      else
        puts "Sorry, I don't know how to #{command}"
    end
    end
  end
 end

repl = Repl.new

repl.run
