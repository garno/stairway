# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'stairway/version'

Gem::Specification.new do |spec|
  spec.name          = "stairway"
  spec.version       = Stairway::VERSION
  spec.authors       = ["Samuel Garneau"]
  spec.email         = ["samgarneau@gmail.com"]
  spec.description   = %q{Easy and intuitive step by step processing of your business logic.}
  spec.summary       = %q{Easy and intuitive step by step processing of your business logic.}
  spec.homepage      = "https://github.com/garno/stairway"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec', '~> 2.14'
  spec.add_development_dependency 'fivemat', '~> 1.2'
end
