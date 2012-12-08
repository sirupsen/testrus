require 'rubygems'
require 'test-unit'
require 'rr'
require 'pry'

$: << File.expand_path(File.dirname(__FILE__) + "../lib")

require 'testrus'

class Test::Unit::TestCase
  include RR::Adapters::TestUnit

  def test_path
    File.expand_path(File.dirname(__FILE__))
  end

  def fixture(name)
    File.read "#{test_path}/fixtures/#{name}"
  end
end
