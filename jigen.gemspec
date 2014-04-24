# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'jigen/version'

Gem::Specification.new do |spec|
  spec.name          = "jigen"
  spec.version       = Jigen::VERSION
  spec.authors       = ["kouba_c"]
  spec.email         = ["masubun00@gmail.com"]
  spec.summary       = %q{Timer}
  spec.description   = %q{Timer}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
