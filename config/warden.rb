Warden::Manager.serialize_into_session{|user| user.id}
Warden::Manager.serialize_from_session do |info|
  p info
  User.find(info)
end
  
Warden::Manager.before_failure do |env,opts|
  env['REQUEST_METHOD'] = 'POST'
end

Warden::Strategies.add(:password) do
  def valid?
    params['username'] && params['password']
  end

  def authenticate!
    user = User.authenticate(
      params['username'], 
      params['password']
      )
    user.nil? ? fail!('Could not log in, please check username & password') : success!(user, 'Successfully logged in')
  end
end