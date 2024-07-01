class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: []
  def index
    if params[:email].present?
      @user = User.find_by_email(params[:email])
      if @user
        render json: @user, status: :ok
      else
        render_not_found_response
      end
    else
      render json: { errors: ['User Not Found'] }, status: 404
    end
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user
      if @user.authenticate(params[:password])
        render json: @user, status: :ok
      else
        render json: { errors: ['Invalid password, please try again.'] }, status: :unauthorized
      end
    else
      render_user_not_found
    end
  end

  def show
    @user = find_user
    render json: @user, status: :ok
  end

  def create
    user_params_with_avatar = user_params

    # Check if the 'picture' key is present in the params object
    unless user_params_with_avatar.key?(:picture)
      user_params_with_avatar = user_params_with_avatar.merge(picture: generate_avatar_url(params[:username]))
    end

    user = User.create!(user_params_with_avatar)
    render json: user, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    user = find_user
    user.update!(user_params)
    render json: user, status: :accepted
  end

  def reset
    user = User.find_by_email(params[:email])
    if user
      user.update!(user_params)
      render json: user, status: :ok
    else
      render_not_found_response
    end
  end

  def destroy
    user = find_user
    user.destroy
    render json: { errors: ['User deleted successfully'] }, status: :no_content
  end

  private

  def render_not_found_response
    render json: { errors: ['User Not Found'] }, status: :not_found
  end

  def render_user_not_found
    render json: { errors: ['Invalid email address, please try again later'] }, status: 401
  end

  def find_user
    User.find(params[:id])
  end

  def user_params
    params.permit(:username, :email, :password, :picture, :bio, :role)
  end

  def generate_avatar_url(username)
    "https://ui-avatars.com/api/?background=random&name=#{username}"
  end
end
