require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/queue'

class QueueTest < Minitest::Test

  def setup
    @q = Queue.new

  end

  def test_can_get_contents
    contents = LoadFile.new.contents

    assert_instance_of CSV::Table, contents
    assert_equal "11/12/08 10:47", contents[0][1]
  end

  def test_data_array
    assert_equal Array, @q.data.class
    assert_equal CSV::Table, @q.load_data
  end

  def test_data_holds_data

    assert_instance_of Array, @q.load_data
    assert_equal "11/12/08 10:47", contents[0][1]
  end

end
