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

  def test_run_input
    source = stub!
    source.input do
      [
        Testrus::Input.new(input: "3 1 2 3", output: "10", name: "1"),
        Testrus::Input.new(input: "2 1 2", output: "3", name: "2")
      ]
    end
  end
end
