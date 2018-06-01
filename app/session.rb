class Session < Sinatra::Application

	post '/login' do
		if warden.authenticated?
			return json('Already logged in')
		end
		warden.authenticate!
		json("Successfully logged in")
	end

	post '/unauthenticated' do
		json("Unauthenticated User")
	end

	get '/logout' do
		warden.raw_session.inspect
		warden.logout
		json("Successfully logged out")
	end
end