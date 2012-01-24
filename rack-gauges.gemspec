# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|

  s.name        = "rack-gauges"
  s.version     = File.read('VERSION').to_s
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Lee Hambley"]
  s.email       = ["lee.hambley@gmail.com"]
  s.homepage    = "https://github.com/leehambley/rack-gauges"
  s.summary     = "Rack middleware to inject the Gauges tracking code into outgoing responses."
  s.description = "Simple Rack middleware for implementing gauges tracking in your Ruby-Rack based project. Supports synchronous and asynchronous insertion and configurable load options.  Code blatantly stolen from https://github.com/leehambley/rack-google-analytics."

  s.files        = Dir.glob("lib/**/*") + %w(README.md LICENSE)
  s.require_path = 'lib'

end
