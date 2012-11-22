require 'test_helper'
require 'testrus/input'

class TestInput < Test::Unit::TestCase
  def setup
    @input = Testrus::Input.new(input: "3 1 2 3", output: "6", name: "1")
  end

  def test_input
    assert_equal "3 1 2 3", @input.input
  end

  def test_output
    assert_equal "6", @input.output
  end

  def test_options
    assert_equal({input: "3 1 2 3", output: "6", name: "1"}, @input.options)
  end

  def test_stripped_input
    @input.options[:input] = "\n\n3 1 2 3\n\r\n"
    assert_equal "3 1 2 3", @input.input
  end

  def test_stripped_output
    @input.options[:output] = "\n\n6\n\r\n"
    assert_equal "6", @input.output
  end
  
  def test_name
    assert_equal "1", @input.name
  end

  def test_stripped_name
    @input.options[:name] = "\n\r1\r\n"
    assert_equal "1", @input.name
  end
end
