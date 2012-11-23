require 'test_helper'

class RunnerTest < Test::Unit::TestCase
  def setup
    @runner = Testrus::Runner.new("ruby hello.rb")
  end

  def test_receives_readable_command
    assert_equal "ruby hello.rb", @runner.command
  end

  def test_runs_test_with_given_input

  end
end
