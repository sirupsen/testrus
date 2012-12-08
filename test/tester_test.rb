require 'test_helper'
require 'testrus/input'
require 'testrus/input/file'
require 'testrus/tester'

class TesterTest < Test::Unit::TestCase
  def setup
    @tester = Testrus::Tester.new(:source => :file, :command => "ruby test.rb")
  end

  def test_set_correct_input_source
    assert_instance_of Testrus::Input::File, @tester.source
  end

  def test_set_correct_runner
    assert_instance_of Testrus::Runner, @tester.runner
    assert_equal "ruby test.rb", @tester.runner.command
  end

  def test_default_formatter
    assert_equal :default, @tester.options[:formatter]
  end

  def test_default_source
    assert_equal :file, @tester.options[:source]
  end

  def test_return_formatter_class
    assert_equal Testrus::Tester::Formatter::Default, @tester.formatter
  end

  def test_override_default_options
    @tester = Testrus::Tester.new(:source => :doom)

    assert_equal :doom, @tester.options[:source]
  end
end
