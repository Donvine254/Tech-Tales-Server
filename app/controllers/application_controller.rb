class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'

  # Routes for users
  get '/users' do
    users = User.all
    users.to_json
  end
  get '/users/:id' do
    user = User.find(params[:id])
    user.to_json
  end
  # validate the login
  post '/login' do
    email = params[:email]
    password = params[:password]
    user = User.find_by(email: email, password: password)
    if user
      first_name = user.username.split(' ').first.capitalize
      response_data = { id: user.id, username: first_name }
      response_data.to_json
    else
      status 404
      response_data = { error: 'User not found.' }
      response_data.to_json
    end
  end
  #register new user
  post '/user' do
    user = User.create(username: params[:username], password: params[:password], email: params[:email])
    response = { message: 'user created successfully' }
    response.to_json
  end

  #routes for blogs
  post '/blogs' do
    blog = Blog.create_blog(title: params[:title], image: params[:image], body: params[:body], user_id: params[:user_id])
    response = { message: 'blog created successfully' }
    response.to_json
  end

  get '/blogs' do
    blogs = Blog.all.includes(:user)
    blogs.each { |blog| blog.user.username.capitalize! }
    blogs_json = blogs.as_json(include: { user: { only: [:id, :username] } }).to_json
  end
  
  get '/latest' do
    blogs = Blog.all.includes(:user).order(created_at: :desc)
    blogs.each { |blog| blog.user.username.capitalize! }
    blogs_json = blogs.as_json(include: { user: { only: [:id, :username] } }).to_json
  end
  
  get '/featured' do
    blogs = Blog.all.includes(:user).limit(3)
    blogs.each { |blog| blog.user.username.capitalize! }
    blogs_json = blogs.as_json(include: { user: { only: [:id, :username] } }).to_json
  end
  get '/blogs/:id' do
    blog = Blog.find(params[:id])
    blog.to_json
  end
  get '/blogs/user/:id' do
    user_id = params[:id]
    blogs = Blog.includes(:user).where(user_id: user_id)
    blogs.each { |blog| blog.user.username.capitalize! }
    blogs_json = blogs.as_json(include: { user: { only: [:id, :username] } }).to_json
  end
  delete '/blogs/:id' do
    blog = Blog.find(params[:id])
    blog.destroy
    response = { message: 'blog deleted successfully'}
    response.to_json
  end
  patch '/blogs/:id' do
    blog = Blog.find(params[:id])
    blog.update(title: params[:title], image: params[:image], body: params[:body])
    blog.save
    blog.to_json
  end

  # post '/blogs' do
  #   new_blog= Blog.create(title: params[:title], body: params[:body])
  #   new_blog.to_json
  # end
  # patch '/blogs/:id' do
  #   blog= blog.find(params[:id])
  #   blog.update(username: params[:username], body: params[:body])
  #   blog.save
  #   blog.to_json
  # end
  # delete '/blogs/:id' do
  #   blog= blog.find(params[:id])
  #   blog.destroy
  #   blog.to_json
  # end
end
