class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
    # before_action :rate_limit
    def create 
      @user = User.find_by(email: params[:email])
  requests= @user.requests.count
puts requests
      if @user
        if @user.authenticate(params[:password])
          render json: @user, status: :found
        else  
          render json: { error: "Wrong password, please try again." }, status: :unauthorized
        end
      else
        render_not_found
      end
    end
  
    private
  
    def render_not_found
      render json: { error: "User not found" }, status: :not_found
    end
  end
  