
Rack::Attack.throttle('login/email', limit: 3, period: 60.seconds) do |req|
  if req.path == '/login' && req.post?
    # req.params['email']
    req.ip
  end
end