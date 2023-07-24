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
      response_data = { id: user.id, username: user.username }
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
    blogs = Blog.all
    blogs.to_json
  end
  # get '/blogs/:id' do
  #   blog= blog.find(params[:id])
  #   blog.to_json
  # end
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
