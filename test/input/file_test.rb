require 'test_helper'
require 'testrus/input/file'
require 'testrus/input'

class InputFileTest < Test::Unit::TestCase
  def test_fetch_and_associate_simple_file_tests
    File.open("input.1", "w") { |f| f.write "3 1 2 3" }
    File.open("output.1", "w") { |f| f.write "6" }

    input_file = Testrus::Input::File.new
    parsed_input = input_file.input

    assert_equal "3 1 2 3", parsed_input.first.input
    assert_equal "6", parsed_input.first.output
    assert_equal "1", parsed_input.first.name
  end

  def test_fetch_and_associate_in_out_format_file_tests
    File.open("input.in.1", "w") { |f| f.write "3 1 2 3" }
    File.open("output.in.1", "w") { |f| f.write "6" }

    input_file = Testrus::Input::File.new
    parsed_input = input_file.input

    assert_equal "3 1 2 3", parsed_input.first.input
    assert_equal "6", parsed_input.first.output
    assert_equal "1", parsed_input.first.name
  end

  def test_fetch_and_ssociate_multiple_simple_file_tests
    File.open("input.1", "w") { |f| f.write "3 1 2 3" }
    File.open("output.1", "w") { |f| f.write "6" }

    File.open("input.2", "w") { |f| f.write "2 1 2" }
    File.open("output.2", "w") { |f| f.write "3" }

    input_file = Testrus::Input::File.new
    parsed_input = input_file.input

    assert_equal "3 1 2 3", parsed_input.first.input
    assert_equal "6", parsed_input.first.output
    assert_equal "1", parsed_input.first.name

    assert_equal "2 1 2", parsed_input[1].input
    assert_equal "3", parsed_input[1].output
    assert_equal "2", parsed_input[1].name
  end
end
