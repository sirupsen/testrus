require 'test_helper'

class RunnerTest < Test::Unit::TestCase
  def setup
    @path = File.expand_path(File.join(File.dirname(__FILE__), "/program.rb"))
    @runner = Testrus::Runner.new("ruby #{@path}")
  end

  def test_receives_readable_command
    assert_equal "ruby #{@path}", @runner.command
  end

  def test_runs_test_with_given_input
    input = Testrus::Input.new input: "6", output: "6", name: "1"
    assert_instance_of Testrus::Runner::Run, @runner.run(input)
  end
end
