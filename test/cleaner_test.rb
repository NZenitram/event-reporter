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

  def test_can_clean_phonenumber
    assert_equal "0000000000", @c.clean_phone(nil)
    assert_equal "0000000000", @c.clean_phone("")
    assert_equal "6033053000", @c.clean_phone("(603) 305-3000")
    assert_equal "0000000000", @c.clean_phone("9.82E+00")
  end

  def test_can_fix_state
  end



end
