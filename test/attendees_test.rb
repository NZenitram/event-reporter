require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/attendees'

class AttendeesTest < Minitest::Test

  def setup
    @a = Attendees.new
  end

  def tests_if_exists
    assert_instance_of Attendees, @a
  end

  def test_can_get_contents

    contents = Attendees.new.contents

    assert_instance_of Array, contents
    assert_equal "RegDate", contents[0][1]
  end


end
