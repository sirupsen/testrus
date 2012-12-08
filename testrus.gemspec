# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'testrus/version'

Gem::Specification.new do |gem|
  gem.name          = "testrus"
  gem.version       = Testrus::VERSION
  gem.authors       = ["Simon H. Eskildsen"]
  gem.email         = ["sirup@sirupsen.com"]
  gem.description   = %q{Friendly walrus aiding participators in informatics competitions to test their programs.}
  gem.summary       = %q{Testing for informatics competitions.}
  gem.homepage      = ""

  gem.add_dependency("colored", "1.2")

  gem.add_development_dependency("test-unit", "2.5.2")
  gem.add_development_dependency("fakefs", "0.4.1")
  gem.add_development_dependency("pry", "0.9.10")
  gem.add_development_dependency("rr", "1.0.4")
  gem.add_development_dependency("test-unit", "2.5.3")
  gem.add_development_dependency("rake", "10.0.2")

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
