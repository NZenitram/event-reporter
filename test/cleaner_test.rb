require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/cleaner'

class CleanerTest < Minitest::Test



  def test_can_clean_first_name
    assert_equal "allison", Cleaner.clean_name("AlLisOn")
    assert_equal "mary kate", Cleaner.clean_name("Mary Kate")
    assert_equal "none", Cleaner.clean_name("")
    assert_equal "none", Cleaner.clean_name(nil)
  end


  def test_can_clean_zipcode
    assert_equal "00000", Cleaner.clean_zip(nil)
    assert_equal "00123", Cleaner.clean_zip("123")
    assert_equal "12345", Cleaner.clean_zip("123456")
    assert_equal "12345", Cleaner.clean_zip("12345")
  end

  def test_can_clean_phonenumber
    assert_equal "0000000000", Cleaner.clean_phone(nil)
    assert_equal "0000000000", Cleaner.clean_phone("")
    assert_equal "6033053000", Cleaner.clean_phone("(603) 305-3000")
    assert_equal "0000000000", Cleaner.clean_phone("9.82E+00")
  end

  def test_can_fix_state
  end



end
