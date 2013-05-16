# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'datacash/version'

Gem::Specification.new do |spec|
  spec.name          = "Datacash"
  spec.version       = Datacash::VERSION
  spec.authors       = ["Robert Williams", "Richard Grundy"]
  spec.email         = ["rob@r-williams.com", "richguk@gmail.com"]
  spec.description   = %q{TODO: Write a gem description}
  spec.summary       = %q{TODO: Write a gem summary}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "builder", "~> 2.0"
  spec.add_dependency "hashie"
  spec.add_dependency "multi_xml", "~> 0.5.3"
  spec.add_dependency "rest-client", "~> 1.6"

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
