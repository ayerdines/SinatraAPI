class Discovery < Sinatra::Application

	get '/organization' do
		warden.authenticate!
		user = warden.user
		json(user.organization)
	end	  
end