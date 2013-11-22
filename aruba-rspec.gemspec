# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aruba/rspec/version'

Gem::Specification.new do |spec|
  spec.name          = "aruba-rspec"
  spec.version       = Aruba::RSpec::VERSION
  spec.authors       = ["Eric Saxby"]
  spec.email         = %w(sax@livinginthepast.org)
  spec.summary       = %q{Bridge RSpec and Aruba to test command-line tools}
  spec.description   = %q{Aruba and ArubaDoubles help to test command-line tools, but they are build around Cucumber. This gem helps integrate with RSpec.}
  spec.homepage      = "https://github.com/livinginthepast/aruba-rspec"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'aruba'
  spec.add_dependency 'aruba-doubles'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
