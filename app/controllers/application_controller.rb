class ApplicationController < ActionController::API
    include ActionController::Cookies
    include ActionController::HttpAuthentication::Basic::ControllerMethods
   
    private
    # def authenticate_user
    #     authenticate_or_request_with_http_basic do |username, password|
    #       user = User.find_by(username: username)
    #       user && user.authenticate(password)
    #     end
    #   end
  
end
