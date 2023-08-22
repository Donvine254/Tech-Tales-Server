class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  
    before_action :rate_limit_check, only: :create
  
    def create
      @user = User.find_by(email: params[:email])
  
      if @user && @user.authenticate(params[:password])
        LoginAttempt.where(email: params[:email]).delete_all
        render json: @user, status: :found
      else  
        render json: { error: "Wrong password, please try again." }, status: :unauthorized
      end
    end
  
    private
  
    def render_not_found
      render json: { error: "User not found" }, status: :not_found
    end
  
    def rate_limit_check
        user_email = params[:email]
        max_attempts = 3
        time_window = 1.minute
    
        attempts_within_window = LoginAttempt
          .where(email: user_email)
          .where("created_at >= ?", Time.now - time_window)
          .count
    
        if attempts_within_window >= max_attempts
          render json: { error: "Too many requests. Please wait and try again." }, status: :too_many_requests
        else
          LoginAttempt.create(email: user_email)
        end
      end
  
  end
  
  