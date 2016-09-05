require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cleaner'

class CleanerTest < Minitest::Test

  def setup
    @c = Cleaner.new
  end

  def test_can_clean_first_name
    assert_equal "allison", @c.clean_name("AlLisOn")
    assert_equal "mary kate", @c.clean_name("Mary Kate")
    assert_equal "none", @c.clean_name("")
    assert_equal "none", @c.clean_name(nil)
  end


  def test_can_clean_zipcode
    assert_equal "00000", @c.clean_zip(nil)
    assert_equal "00123", @c.clean_zip("123")
    assert_equal "12345", @c.clean_zip("123456")
    assert_equal "12345", @c.clean_zip("12345")
  end



end
