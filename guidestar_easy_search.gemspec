# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'guidestar_easy_search/version'

Gem::Specification.new do |spec|
  spec.name          = "guidestar_easy_search"
  spec.version       = GuidestarEasySearch::VERSION
  spec.authors       = ["Timothy King"]
  spec.email         = ["timothy@givecorps.com"]
  spec.summary       = %q{Performs full text and EIN search.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'guidestar'
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec'
end
