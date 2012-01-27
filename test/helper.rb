require 'rubygems'
require 'test/unit'
require 'shoulda'
require 'rack'
require 'rack/test'
require File.expand_path('../../lib/rack/gauges',__FILE__)

class Test::Unit::TestCase
  include Rack::Test::Methods
  
  def app; Rack::Lint.new(@app); end
  
  def mock_app(options)
    main_app = lambda { |env|
      request = Rack::Request.new(env)
      case request.path
      when '/head' then     [200, {'Content-Type' => 'application/html'}, ['<head>content</head>']]
      when '/test.xml' then [200, {'Content-Type' => 'application/xml' }, ['<xml>content</xml>']]
      when '/body' then     [200, {'Content-Type' => 'application/html'} ,['<body>content</body>']]
      else                  [404, {'Content-Type' => 'application/html'}, ['content']]
      end
    }

    builder = Rack::Builder.new
    builder.use Rack::Gauges, options
    builder.run main_app
    @app = builder.to_app
  end
end
