# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|

  s.name        = "rack-gauges"
  s.version     = File.read('VERSION').to_s
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Thunderbolt Labs", "Lee Hambley"]
  s.email       = ["us@thunderboltlabs.com"]
  s.homepage    = "https://github.com/thunderboltlabs/rack-gauges"
  s.summary     = "Rack middleware to inject the Gauges tracking code into outgoing responses."
  s.description = "Simple Rack middleware for implementing gauges tracking in your Ruby-Rack based project. Code blatantly stolen from https://github.com/leehambley/rack-google-analytics."

  s.files        = Dir.glob("lib/**/*") + %w(README.md LICENSE)
  s.require_path = 'lib'

  s.add_development_dependency 'rack'
  s.add_development_dependency 'rack-test'
  s.add_development_dependency 'shoulda'
  s.add_development_dependency 'rake'
  s.add_development_dependency 'yard'
end
