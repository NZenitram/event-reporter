class HelpFile

  def load_text
    puts "Please enter 'load <file_name>' to save your file to the queue; leave <file_name> blank for default attendees list."
  end

  def find_text
    puts "Please enter 'find <attribute> <criteria>' to search the list of attendees."
  end

  def queue_text
    puts "Here is a list of queue <commands>:
'count'\n'clear'\n'distinct'\n'print'\n'print by attribute'\n'save to <filename.csv>'\n'export to html file <filename.html>'"
  end

  def queue_print
       p '                          --------------------------------------------                              '
    puts "Queue print displays the information of the people entered in the queue based on your find criteria."
       p '                          --------------------------------------------                              '
  end

  def queue_count
       p '                       --------------------------------------------                        '
    puts "Queue count displays the number of people entered in the queue based on your find criteria."
       p '                       --------------------------------------------                        '
  end

end
