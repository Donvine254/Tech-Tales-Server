class Rack::Attack
    Rack::Attack.cache.store = Rails.cache 
    Rack::Attack.throttle('login/email', limit: 3, period: 30.seconds) do |req|
        if req.path == '/login' && req.post?
          req.params[:email]
        end
      end
end

