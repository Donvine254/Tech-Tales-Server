class LoginAttemptsController < ApplicationController
    def index 
        render json: LoginAttempt.all, status: :ok
    end
end
