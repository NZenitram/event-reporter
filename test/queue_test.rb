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

  def test_data
    assert_equal CSV::Table, @q.data.class
  end

  def test_can_read_q
    assert_equal "11/12/08 10:47", @q.data[0][1]
  end

  def test_will_return_downcase
    assert_equal , @q.iterate("AlLiSon")
  end

end
