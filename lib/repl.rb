
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
        load_command(command[1])
      when 'find'
        if @loaded == nil
          @loaded.to_s
        elsif
        @loaded.queue(command[1], command[2..-1].join(" ").downcase)
        end
      when 'queue'
        queue_command(command[1..2].join, command[3])
      when 'help'
        help_command(command[1], command[2])
      else
        puts "Sorry, I don't know how to #{command}"
    end
    end
  end


  def load_command(file)
    if file == nil
      @loaded = Queue.new
    else
      full_file_name = "./data/#{file}"
      @loaded = Queue.new(full_file_name)
    end
  end

  def help_command(input, word)
    if input == nil
       puts "Which command would you like help with?\n\nload\n\nqueue count/print\n\nfind"
    elsif
      input + word == "queuecount"
        @help.queue_count
    else
      input + word == "queueprint"
        @help.queue_print
    end
  end


  def queue_command(command, file)
    if command == nil
      @help.queue_text
    elsif
      command == "count"
      if @loaded == nil
      puts 0
      elsif
        puts @loaded.count
      end
    elsif
      command == "clear"
      if @loaded == nil
        @loaded.to_s
      elsif
        @loaded.clear
      end
    elsif
      command == "print"
      @loaded.prints
    elsif
      command == "printby"
      @loaded.print_by(file)
    elsif
      command == "save"
      if @loaded == nil
        @loaded.to_s
      elsif
      @loaded.save_to(file)
      end
    end
  end
end

repl = Repl.new

repl.run
