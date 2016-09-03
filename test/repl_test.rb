require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/repl'

class ReplTest < Minitest::Test

  def setup
    @r = Repl.new
    @a = Attendees.new
  end

  def tests_if_exists
    assert_instance_of Repl, @r
  end

  def test_can_return_csv

    assert_equal @a.contents, @r.list.contents
  end
end
