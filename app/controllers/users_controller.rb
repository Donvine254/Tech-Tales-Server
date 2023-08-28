class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity
  before_action :authenticate_user, except: [:create]
  wrap_parameters format: []
  def index
    render json: User.all, status: :ok
  end

  def show
    user = find_user
    render json: user, status: :ok
  end

  def create
    user = User.create!(user_params.merge(active: true))
    render json: { message: 'user created successfully' }, status: :created
  end

  def update
    user = find_user
    user.update!(user_update_params)
    render json: { message: 'User updated successfully' }, status: :ok
  end

  def destroy
    user = find_user
    user.update_column(:active, false)
    render json: { message: 'User deleted successfully' }, status: :ok
  end

  private

  def find_user
    user = User.find(params[:id])
  end

  def render_not_found
    render json: { error: 'User not found' }, status: :not_found
  end

  def render_unprocessable_entity(invalid)
    render json: { errors: invalid.record.errors.full_messages }
  end

  def user_params
    params.permit(:username, :email, :password)
  end

  def user_update_params
    params.permit(:username, :password)
  end

  def authenticate_user
    user = User.find_by(username: params[:name]) 
    @current_user = User.find_by(id: session[:user_id]) || nil
    if @current_user
     #render whatever is requested
    elsif user&.authenticate(params[:password])
    # render whatever is being requested
    # add an elseif to check whether the session_cookie exists
    else
      render json: { error: 'action forbidden' }, status: :forbidden
    end
  end
end
