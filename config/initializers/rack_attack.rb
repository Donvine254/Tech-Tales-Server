
Rack::Attack.throttle('login/email', limit: 3, period: 60.seconds) do |req|
  if req.path == '/login' && req.post?
    # req.params['email']
    req.ip
  end
end

Rack::Attack.throttle("requests by ip", limit: 10, period: 1.minutes) do |request|
  request.ip unless request.get?
end
Rack::Attack.throttle("requests by ip", limit: 20, period: 1.minutes) do |request|
  request.ip
end

Rack::Attack.throttle("logins/email", :limit => 3, :period => 60.seconds) do |req|
  if req.path == '/login' && req.post?
    # return the email if present, nil otherwise
    req.params['email'].presence
  end
end
