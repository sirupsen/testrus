require 'test_helper'

class RunnerRunTest < Test::Unit::TestCase
  def setup
    @output = fixture("time_run.txt")
    @test = Testrus::Input.new(input: "world", output: "hello world\nyou are fine", name: "1")

    @run = Testrus::Runner::Run.new(@output, @test)
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

  def test_passed
    assert @run.passed?, "Run should pass"
  end

  def test_not_passed
    @test = Testrus::Input.new(input: "world", output: "hello world\nyou are not fine", name: "1")
    @run = Testrus::Runner::Run.new(@output, @test)

    assert !@run.passed?, "Run should not pass"
  end

  def test_within_constraints
    stub(@run).real_time { 0.84 }
    stub(@run).memory_usage { 37.00 }

    assert @run.within_constraints?
  end

  def test_not_within_time_constraints
    stub(@run).real_time { 1.84 }
    stub(@run).memory_usage { 37.00 }

    assert !@run.within_constraints?
  end

  def test_not_within_memory_constraints
    stub(@run).real_time { 0.84 }
    stub(@run).memory_usage { 84.00 }

    assert !@run.within_constraints?
  end
end
