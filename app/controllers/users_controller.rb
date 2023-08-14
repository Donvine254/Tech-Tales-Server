class UsersController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  def login
    @user = User.find_by_email(params[:email])
    
    if @user && @user.password== params[:password]
      render json: @user, only: %i[id username], status: :found
    else
      render json: {}, status: :unauthorized
    end
  end

  def create
    user = User.create!(user_params)
    render json: { message: 'User created successfully' }, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    user = find_user
    user.update!(user_params)
    render json: { message: 'User details updated successfully' }, status: :accepted
  end

  def destroy
    user = find_user
    user.destroy
    render json: { message: 'User deleted successfully' }, status: :no_content
  end

  private

  def render_not_found_response
    render json: { error: 'User Not Found' }, status: :not_found
  end

  def find_user
    user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :email, :password)
  end

  def render_pizza_details(pizzas, status)
    render json: pizzas.as_json(except: %i[created_at updated_at]), status: status
  end
end
