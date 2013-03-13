# -*- encoding: utf-8 -*-
$:.unshift File.expand_path("../lib", __FILE__)
require 'foreman-env/version'

Gem::Specification.new do |gem|
  gem.name          = "foreman-env"
  gem.license       = "MIT"
  gem.version       = ForemanEnv::VERSION

  gem.authors       = ["Tim Taylor"]
  gem.email         = ["tim@tool-man.org"]
  gem.homepage      = "https://github.com/toolbear/foreman-env"

  gem.summary       = %q{Loads a Foreman-style environment file.}

  gem.description   = gem.summary

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})

  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rake'
  gem.add_development_dependency 'rspec'
  gem.add_development_dependency 'fakefs', '~> 0.3.2'
end
