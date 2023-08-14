class CommentsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: []

  def index
    comments = Comment.all
    comment_details = comments.map { |comment| render_comment(comment) }
    render json: comment_details, status: :ok
  end

  def show
    comment = find_comment
    comment_details = render_comment(comment)
    render json: comment_details, status: :ok
  end

  def create
    comment = Comment.create!(comments_params)
    comment_details = render_comment(comment)
    render json: comment_details, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    comment = find_comment
    comment.update!(comments_params)
    comment_details = render_comment(comment)
    render json: comment_details, status: :accepted
  end

  def destroy
    comment = find_comment
    comment.destroy!
    render json: {}, status: :no_content
  end
  def blogcomments 
    blog = Blog.find(params[:id])
    comments = Comment.where(blog_id: blog.id)
    comment_details = comments.map { |comment| render_comment(comment) }
    render json: comment_details, status: :ok
  end

  private

  def render_not_found_response
    render json: { error: 'Comment Not Found' }, status: :not_found
  end

  def find_comment
    comment = Comment.find(params[:id])
  end

  def comments_params
    params.permit(:body, :user_id, :blog_id)
  end

  def render_comment(comment)
    comment = {
      id: comment.id,
      body: comment.body,
      blog_id: comment.blog_id,
      blog: comment.blog.title,
      created_at: comment.created_at_date,
      user_id: comment.user_id,
      author: comment.user.username.capitalize!
    }
  end
end
