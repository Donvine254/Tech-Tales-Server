class BlogsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: []

  def index
    blogs = Blog.all
    render json: blogs, status: :ok
  end

  def show
    blog = find_blog
    render json: blog, status: :ok
  end
  def userblog 
    user_id = params[:id]
    blogs=Blog.where(user_id: user_id)
    render json: blogs, status: :ok
  end
  def latest 
    blogs= Blog.all.order(created_at: :desc)
    render json: blogs, status: :ok

  end
  def featured 
    blogs = Blog.all.sort_by { |blog| -blog.comments_count }.take(5)
    render json: blogs, status: :ok
  end

  def create
    blog = Blog.create_blog(blog_params)
    render json: blog, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    blog = find_blog
    blog.update!(blog_params.merge(slug:Blog.slugify(blog_params[:title])))
    render json: blog, status: :accepted
  end

  def destroy
    blog = find_blog
    blog.destroy!
    render json: {}, status: :no_content
  end

  private

  def render_not_found_response
    render json: { error: ['Blog Not Found'] }, status: :not_found
  end

  def find_blog
    blog = Blog.find(params[:id])
  end

  def blog_params
    params.permit(:title, :image, :body, :tags, :user_id)
  end
end
