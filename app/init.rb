Dir[File.dirname(__FILE__) + '/*.rb'].each {|file| require file}

before do 
	content_type 'application/json'
end

after do
	session[:time] = Time.now
end