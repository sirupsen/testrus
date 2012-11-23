require 'rubygems'
require 'test-unit'
require 'rr'
require 'pry'
$: << File.expand_path(File.dirname(__FILE__) + "../lib")

class Test::Unit::TestCase
  include RR::Adapters::TestUnit
end
