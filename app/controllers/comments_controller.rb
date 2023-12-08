class CommentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: []

  def index
    render json: Comment.all, status: :ok
  end

  def show
    comment = find_comment
    render json: comment, status: :ok
  end

  def create
    comment = Comment.create!(comments_params)
    render json: comment, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    comment = find_comment
    comment.update!(comments_params)
    render json: comment, status: :accepted
  end

  def destroy
    comment = find_comment
    comment.destroy!
    render json: {}, status: :no_content
  end

  def blogcomments
    blog = Blog.find(params[:id])
    render json: blog.comments, status: :ok
  end

  private

  def render_not_found_response
    render json: { errors: ['Comment Not Found'] }, status: :not_found
  end

  def find_comment
    comment = Comment.find(params[:id])
  end

  def comments_params
    params.permit(:body, :user_id, :blog_id)
  end
end
