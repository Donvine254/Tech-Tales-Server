class SessionsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found

    def create
      # create a new session for the user
      @user = User.find_by(email: params[:email])
  
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        session[:username] = @user.username
        render json: { message: "Logged in as #{session[:username]}" }, status: :found
      else  
        render json: { error: "Wrong password, please try again." }, status: :unauthorized
      end
    end
    def destroy
      # # get the user with the specified ID
      # user = User.find(params[:id])
      # remove the user from the session
      session.delete(:user_id)
      session.delete(:username)
      @_current_user = nil
      render json: { message: 'Logged out successfully'}, status: :unauthorized
    end
    private
  
    def render_not_found
      render json: { error: "User not found" }, status: :not_found
    end 
    def current_user
      @_current_user ||= session[:user_id] &&
        User.find_by(id: session[:user_id])
    end
  end
  
  