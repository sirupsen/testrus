require 'rubygems'
require 'test-unit'
$: << File.expand_path(File.dirname(__FILE__) + "../lib")

class FogTest < Test::Unit::TestCase
  def self.test(description, &block)
    define_method("test_" + description.split.join('_').gsub(/\W/, ''), block)
  end
end
