class Cleaner


  def clean_zip(zipcode)
    zipcode.to_s.rjust(5,"0")[0..4]
    # if zipcode.nil?
    #   zipcode = "00000"
    # elsif zipcode.length < 5
    #   zipcode = zipcode.rjust 5, "0"
    # elsif zipcode.length > 5
    #   zipcode = zipcode[0..4]
    # else
    #   zipcode
    # end
  end

  def clean_name(name)
    if name == nil
       name = "none"
    elsif
      name == ""
      name = "none"
    else
      name = name.downcase
    end
  end


end
