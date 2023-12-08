class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: []
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
    user_params_with_avatar = user_params.merge(picture: generate_avatar_url(params[:username]))
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
    user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :email, :password)
  end
  def generate_avatar_url(username)
  "https://ui-avatars.com/api/?name=#{username}"
end
end
