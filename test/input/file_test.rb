require 'test_helper'
require 'testrus/input/file'
require 'testrus/input'

class InputFileTest < Test::Unit::TestCase
  def root_path
    File.expand_path(File.dirname(__FILE__) + "/../..")
  end

  def setup
    @input_file = Testrus::Input::File.new(pwd: root_path)
  end

  def test_empty_pwd_context_defaults_to_pwd
    @input_file = Testrus::Input::File.new(pwd: "")

    mock(@input_file).default_pwd { '/home/testrus/project' }
    assert_equal "/home/testrus/project", @input_file.pwd
  end

  def test_nil_pwd_context_defaults_to_pwd
    @input_file = Testrus::Input::File.new(pwd: nil)

    mock(@input_file).default_pwd { '/home/testrus/project' }
    assert_equal "/home/testrus/project", @input_file.pwd
  end

  def test_fetch_and_associate_simple_file_tests
    File.open("#{root_path}/input.1", "w") { |f| f.write "3 1 2 3" }
    File.open("#{root_path}/output.1", "w") { |f| f.write "6" }

    parsed_input = @input_file.input

    assert_equal "3 1 2 3", parsed_input.first.input
    assert_equal "6", parsed_input.first.output
    assert_equal "1", parsed_input.first.name
  end

  def test_fetch_and_associate_in_out_format_file_tests
    File.open("#{root_path}/input.in.1", "w") { |f| f.write "3 1 2 3" }
    File.open("#{root_path}/output.in.1", "w") { |f| f.write "6" }

    parsed_input = @input_file.input

    assert_equal "3 1 2 3", parsed_input.first.input
    assert_equal "6", parsed_input.first.output
    assert_equal "1", parsed_input.first.name
  end

  def test_fetch_and_ssociate_multiple_simple_file_tests
    File.open("#{root_path}/input.1", "w") { |f| f.write "3 1 2 3" }
    File.open("#{root_path}/output.1", "w") { |f| f.write "6" }

    File.open("#{root_path}/input.2", "w") { |f| f.write "2 1 2" }
    File.open("#{root_path}/output.2", "w") { |f| f.write "3" }

    parsed_input = @input_file.input

    assert_equal "3 1 2 3", parsed_input.first.input
    assert_equal "6", parsed_input.first.output
    assert_equal "1", parsed_input.first.name

    assert_equal "2 1 2", parsed_input[1].input
    assert_equal "3", parsed_input[1].output
    assert_equal "2", parsed_input[1].name
  end
end
