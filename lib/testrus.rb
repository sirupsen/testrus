require "testrus/version"

Dir[File.dirname(__FILE__) + "/testrus/**/*.rb"].each do |file|
  require file
end
