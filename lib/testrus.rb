require "testrus/version"
require 'pry'

Dir[File.dirname(__FILE__) + "/testrus/**/*.rb"].each do |file|
  require file
end
