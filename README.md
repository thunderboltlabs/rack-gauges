# Rack Gauges

Simple Rack middleware to help injecting the http://gaug.es tracking code into the footer of your websites.

This middleware injects the gauges tracker code into the correct place of any request with `Content-Type` containing `html` (therefore `text/html` and similar).

This code was blatantly stolen (and piped through `sed`) from https://github.com/leehambley/rack-google-analytics.

## Usage

#### Gemfile:
    gem 'rack-gauges', :require => 'rack/gauges'

#### Sinatra
    ## app.rb
    use Rack::Gauges, :tracker => 'UA-xxxxxx-x'

#### Rails

    ## environment.rb:
    config.gem 'rack-gauges', :lib => 'rack/gauges'
    config.middleware.use Rack::Gauges, :tracker => '4ec817e9f5a1f5068d000001'

## Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

## Copyright

Copyright (c) 2009-2011 Lee Hambley. See LICENSE for details.
With thanks to Ralph von der Heyden http://github.com/ralph/ and Simon `cimm` Schoeters http://github.com/cimm/ - And the biggest hand to Arthur `achiu` Chiu for the huge work that went into the massive 0.9 re-factor.
