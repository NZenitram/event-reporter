require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/attendees'
require './lib/load_file'

class AttendeesTest < Minitest::Test


  def setup
               {  regdate:       "11/12/08 10:47",
                  first_name:    "Allison",
                  last_name:     "Nguyen",
                  email_address: "arannon@jumpstartlab.com",
                  homephone:     "6154385000",
                  street:        "3155 19th St NW",
                  city:          "Washington",
                  state:         "DC",
                  zipcode:       "20010"
                }

  end

  def test_will_return_downcase
    assert_equal[:regdate], attendees.regdate
    assert_equal[:first_name], attendees.first_name
  end

end
