# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'spanx/client/version'

Gem::Specification.new do |spec|
  spec.name          = "spanx-client"
  spec.version       = Spanx::Client::VERSION
  spec.authors       = ["Paul Henry"]
  spec.email         = ["paul@wanelo.com"]
  spec.summary       = %q{Client for connecting to Spanx's API}
  spec.description   = %q{API Client for connecting to spanx.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "webmock"
end
