require 'test_helper'

class RunnerRunTest < Test::Unit::TestCase
  def setup
    output = fixture("time_run.txt")
    @run = Testrus::Runner::Run.new(output)
  end

  def test_extract_memory_usage
    assert_equal 0.263671875, @run.memory_usage, 0.01
  end

  def test_extract_real_time
    assert_equal 0.18, @run.real_time
  end

  def test_extract_user_time
    assert_equal 0.02, @run.user_time
  end

  def test_extract_sys_time
    assert_equal 0.11, @run.sys_time
  end

  def test_extract_output
    assert_equal "hello world\nyou are fine", @run.output
  end
end
