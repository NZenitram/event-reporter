require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/repl'

class ReplTest < Minitest::Test


  def tests_if_exists
    skip
    assert_instance_of Repl, @r
  end

  def test_load_command
    r = Repl.new
    file = "full_event_attendees.csv"
    assert_equal "full_event_attendees.csv", r.loaded
  end

end
