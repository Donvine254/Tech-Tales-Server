class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def create
      # create a new session for the user
      @user = User.find_by(email: params[:email])
  
      if @user && @user.authenticate(params[:password])
        render json: @user, status: :found
      else  
        render json: { error: "Wrong password, please try again." }, status: :unauthorized
      end
    end
  
    private
  
    def render_not_found
      render json: { error: "User not found" }, status: :not_found
    end 
  end
  
  