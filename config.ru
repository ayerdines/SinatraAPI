require_relative 'app'

builder = Rack::Builder.new do
  use Rack::MethodOverride
  use Rack::Session::Cookie, :key => 'cc_discovery_session', :secret => settings.session_secret, :expire_after => settings.session_timeout
  use Warden::Manager do |config|
    config.scope_defaults :default,
      strategies: [:password], 
      action: 'unauthenticated'
    config.failure_app = self
  end

  map '/' do
    run Session
  end

  map '/api' do
    run Discovery
  end
end

run builder