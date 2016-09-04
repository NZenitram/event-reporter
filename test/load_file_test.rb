require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/load_file'

class LoadFileTest < Minitest::Test

  def setup
    @a = LoadFile.new
  end

  def tests_if_exists
    assert_instance_of LoadFile, @a
  end

  def test_can_get_contents

    contents = LoadFile.new.contents

    assert_instance_of CSV::Table, contents
    assert_equal "11/12/08 10:47", contents[0][1]
  end


end
