require 'rack'
require 'erb'

module Rack

  class Gauges
    def initialize(app, options = {})
      raise ArgumentError, "Tracker must be set!" unless options[:tracker] and !options[:tracker].empty?
      @app, @options = app, options
    end

    def call(env); dup._call(env); end

    def _call(env)
      @status, @headers, @response = @app.call(env)
      return [@status, @headers, @response] unless html?
      response = Rack::Response.new([], @status, @headers)
      @response.each { |fragment| response.write inject(fragment) }
      response.finish
    end

    private

    def html?; @headers['Content-Type'] =~ /html/; end

    def inject(response)
      @template ||= ::ERB.new ::File.read ::File.expand_path("../templates/gauges.erb",__FILE__)
      response.gsub(%r{</body>}, @template.result(binding) + "</body>")
    end

  end

end
