require 'pry'

class HelpFile

  def load_text
    puts "Please enter 'load <file_name>' to save your file to the queue; leave <file_name> blank for default attendees list."
  end

  def find_text
    puts "Please enter 'find <attribute> <criteria>' to search the list of attendees."
  end

end
