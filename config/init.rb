Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file}

set :session_timeout, 60
set :session_secret, ENV['CCDISCOVERY_SESSION_SECRET']
