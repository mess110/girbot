# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'girbot/version'

Gem::Specification.new do |spec|
  spec.name          = "girbot"
  spec.version       = Girbot::VERSION
  spec.authors       = ["Cristian Mircea Messel"]
  spec.email         = ["mess110@gmail.com"]

  spec.summary       = %q{Summary}
  spec.description   = %q{Description}
  spec.homepage      = "http://google.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"

  spec.add_dependency "pry"
  spec.add_dependency "watir", "6.1.0"
  spec.add_dependency "selenium-webdriver", "3.0.5"
  spec.add_dependency "watir-webdriver", "0.9.9"
  spec.add_dependency "nokogiri", "1.8.1"
  spec.add_dependency "headless", "2.3.1"
end
