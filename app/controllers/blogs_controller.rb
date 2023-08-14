class BlogsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  wrap_parameters format: []

  def index
    blogs = Blog.all
    blog_details = blogs.map { |blog| blog_details(blog) }
    render json: blog_details, status: :ok
  end

  def show
    blog = find_blog
    blog_details = blog_details(blog)
    render json: blog_details, status: :ok
  end
  def userblog 
    user_id = params[:id]
    blogs=Blog.where(user_id: user_id)
    blog_details = blogs.map { |blog| blog_details(blog) }
    render json: blog_details, status: :ok
  end
  def latest 
    blogs= Blog.all.order(created_at: :desc)
    blog_details = blogs.map { |blog| blog_details(blog) }
    render json: blog_details, status: :ok

  end
  def featured 
    blogs = Blog.all.sort_by { |blog| -blog.comments_count }.take(5)
    blog_details = blogs.map { |blog| blog_details(blog) }
    render json: blog_details, status: :ok
  end

  def create
    blog = Blog.create_blog(blog_params)
    blog_details= blog_details(blog)
    render json: blog_details, status: :created
  rescue ActiveRecord::RecordInvalid => e
    render json: { errors: e.record.errors.full_messages }, status: :unprocessable_entity
  end

  def update
    blog = find_blog
    blog.update!(blog_params.merge(slug:Blog.slugify(blog_params[:title])))
    blog_details= blog_details(blog)
    render json: blog_details, status: :accepted
  end

  def destroy
    blog = find_blog
    blog.destroy!
    render json: {}, status: :no_content
  end

  private

  def render_not_found_response
    render json: { error: 'Blog Not Found' }, status: :not_found
  end

  def find_blog
    blog = Blog.find(params[:id])
  end

  def blog_params
    params.permit(:title, :image, :body, :user_id)
  end

  def blog_details(blog)
    blog_details = {
      id: blog.id,
      title: blog.title,
      body: blog.body,
      slug: blog.slug,
      image: blog.image,
      created_at: blog.created_at_date,
      user_id: blog.user_id,
      author: blog.user.username.capitalize!,
      comments: blog.comments
    }
  end
end
