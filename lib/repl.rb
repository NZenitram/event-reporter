require './lib/attendees'

class Repl
  attr_reader :list

  def initialize
    @list = Attendees.new
  end

  def run
    command = ""
    while command != "q"
      printf "Enter command: "
      command = gets.chomp
    case command
      when 'q' then puts "Goodbye!"
      when 'print' then list.contents
      else
        puts "Sorry, I don't know how to #{command}"
    end
    end
  end

end

repl = Repl.new

repl.run
