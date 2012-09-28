# -*- encoding: utf-8 -*-
require File.expand_path('../lib/dynamom/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Michael Gorsuch"]
  gem.email         = ["michael.gorsuch@gmail.com"]
  gem.description   = 'an experimental DynamoDB management API'
  gem.summary       = gem.description
  gem.homepage      = 'https://github.com/gorsuch/dynamom'

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "dynamom"
  gem.require_paths = ["lib"]
  gem.version       = DynaMom::VERSION
  gem.add_development_dependency('rake')
  gem.add_development_dependency('rack-test')
  gem.add_development_dependency('rspec')
  gem.add_dependency('aws-sdk')
  gem.add_dependency('json')
  gem.add_dependency('sinatra')
end
