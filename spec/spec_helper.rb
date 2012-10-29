require 'rspec'
require 'rack/test'
require_relative '../lib/rack_methodoverride_4_all'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end