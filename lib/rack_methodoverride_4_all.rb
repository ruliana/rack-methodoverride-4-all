require 'rack/request'

module Rack
  class MethodOverride4All
    HTTP_METHODS                = %w(GET HEAD PUT POST DELETE OPTIONS)
    METHOD_OVERRIDE_PARAM_KEY   = '_method'
    HTTP_METHOD_OVERRIDE_HEADER = 'HTTP_X_HTTP_METHOD_OVERRIDE'

    def initialize(app, overridable = %w(GET POST))
      @app         = app
      @overridable = HTTP_METHODS & overridable.map(&:to_s).map(&:upcase)
    end

    def call(env)
      override_method(env) if (@overridable.include?(env['REQUEST_METHOD']))
      @app.call(env)
    end

    private
    def override_method(env)
      req    = Request.new(env)
      method = req.params[METHOD_OVERRIDE_PARAM_KEY] || env[HTTP_METHOD_OVERRIDE_HEADER]
      method = method.to_s.upcase

      if HTTP_METHODS.include?(method)
        env['rack.methodoverride.original_method'] = env['REQUEST_METHOD']
        env['REQUEST_METHOD']                      = method
      end
    end
  end
end
