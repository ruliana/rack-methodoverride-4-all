require 'rspec'
require 'rack/test'
require_relative '../lib/rack-methodoverride-4-all'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
end