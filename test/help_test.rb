require 'minitest/autorun'
require 'minitest/pride'
require 'pry'
require './lib/help_file'

class HelpFileTest < Minitest::Test
  def setup
    @h = HelpFile.new
  end

  def test_does_exist
    assert_instance_of HelpFile, @h
  end

  def test_output_is_correct
    
  end




end
