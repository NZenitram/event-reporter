require 'csv'
require 'pry'
require './lib/attendees'
require './lib/load_file'


module Cleaner


  def Cleaner.clean_zip(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
  end

  def Cleaner.clean_name(name)
    if name == nil
       name = "none"
    elsif
      name == ""
      name = "none"
    else
      name = name.downcase
    end
  end

  def Cleaner.clean_phone(num)
    if num == nil
      num = "0000000000"
    elsif num == ""
      num = "0000000000"
    elsif num.length <= 10
      num = "0000000000"
    else
      num = num.gsub(/\D/, '')
      num.rjust(10, "0")
    end
  end


end
