require_relative '../spec_helper'

describe Rack::MethodOverride4All do

  let(:mock_app) { double('Mock App', call: [200, { }, ['Mock App']]) }

  context 'default configuration' do
    let(:app) { Rack::MethodOverride4All.new(mock_app) }

    it 'does NOT change method in "normal" calls (sanity check)' do
      get '/'
      expect(last_request.request_method).to eq('GET')
    end

    it 'overrides method using request parameter' do
      get '/?_method=post'
      expect(last_request.request_method).to eq('POST')
    end

    it 'overrides method using HEADER' do
      header 'X_HTTP_METHOD_OVERRIDE', 'POST'
      get '/'
      expect(last_request.request_method).to eq('POST')
    end

    it 'keeps the original request in another env var' do
      get '/?_method=POST'
      expect(last_request.env['rack.methodoverride.original_method']).to eq('GET')
    end

    it 'does not override if new method is invalid' do
      get '/?_method=INVALID'
      expect(last_request.request_method).to eq('GET')
    end
  end

  context 'custom configuration using "POST" as only overridable method' do
    let(:app) { Rack::MethodOverride4All.new(mock_app, [:post]) }

    it 'overrides POST' do
      post '/?_method=HEAD'
      expect(last_request.request_method).to eq('HEAD')
    end

    it 'does not override GET' do
      get '/?_method=HEAD'
      expect(last_request.request_method).to eq('GET')
    end
  end
end