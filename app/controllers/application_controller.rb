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
  # register new user into database
  post '/user' do
    user = User.create(username: params[:username], password: params[:password], email: params[:email])
    response = { message: 'user created successfully' }
    response.to_json
  end

  # routes for blogs
  post '/blogs' do
    blog = Blog.create_blog(title: params[:title], image: params[:image], body: params[:body],
                            user_id: params[:user_id])
    response = { message: 'blog created successfully' }
    response.to_json
  end

  get '/blogs' do
    blogs = Blog.all.includes(:user)
    blogs.each { |blog| blog.user.username.capitalize! }
    blogs_json = blogs.as_json(include: { user: { only: %i[id username] } }).to_json
  end

  get '/latest' do
    blogs = Blog.all.includes(:user).order(created_at: :desc)
    blogs.each { |blog| blog.user.username.capitalize! }
    blogs_json = blogs.as_json(include: { user: { only: %i[id username] } }).to_json
  end

  # get '/featured' do
  #   blogs = Blog.all.includes(:user).limit(4).order(title: :desc)
  #   blogs.each { |blog| blog.user.username.capitalize! }
  #   blogs_json = blogs.as_json(include: { user: { only: %i[id username] } }).to_json
  # end
  get '/featured' do
    blogs = Blog.all.includes(:user).limit(4)
    blogs = blogs.sort_by { |blog| -blog.comments_count }
  
    blogs.each { |blog| blog.user.username.capitalize! }
  
    blogs_json = blogs.as_json(include: { user: { only: %i[id username] } }).to_json
  end

  get '/blogs/:id' do
    blog = Blog.find(params[:id])
    blog.to_json
  end
  get '/blogs/user/:id' do
    user_id = params[:id]
    blogs = Blog.includes(:user).where(user_id: user_id)
    blogs.each { |blog| blog.user.username.capitalize! }
    blogs_json = blogs.as_json(include: { user: { only: %i[id username] } }).to_json
  end

  get '/fullblogs' do
    blogs = Blog.all.includes(:user, :comments)

    blog_json = blogs.as_json(include: { user: { only: %i[id username] }, comments: {} })
    blog_json.each do |blog|
      blog['user']['username'].capitalize!
    end

    blog_json.to_json
  end
  
  delete '/blogs/:id' do
    blog = Blog.find(params[:id])
    blog.destroy
    response = { message: 'blog deleted successfully' }
    response.to_json
  end
  patch '/blogs/:id' do
    blog = Blog.find(params[:id])
    blog.update(title: params[:title], image: params[:image], body: params[:body])
    blog.save
    blog.to_json
  end
  # routes for comments
  post '/comments' do
    comment = Comment.create(body: params[:body], user_id: params[:user_id], blog_id: params[:blog_id])
    comment_with_user = {
      id: comment.id,
      body: comment.body,
      user_id: comment.user.id,
      username: comment.user.username,
      created_at: comment.created_at
    }
    { comment: comment_with_user }.to_json
  end
  get '/comments' do
    comments = Comment.all
    comments.to_json
  end
  get '/comments/blogs/:id' do
    blog = Blog.find(params[:id])
    comments = blog.comments.includes(:user) 
    comments_with_users = comments.map do |comment|
      {
        id: comment.id,
        body: comment.body,
        user_id: comment.user.id,
        username: comment.user.username,
        created_at: comment.created_at
      }
    end
    { comments: comments_with_users }.to_json
  end

  patch '/comments/:id' do
    comment = Comment.find(params[:id])
    comment.update(body: params[:body])
    comment.save
    # comment.includes(:user).to_json
    comment_with_user = {
      id: comment.id,
      body: comment.body,
      user_id: comment.user.id,
      username: comment.user.username,
      created_at: comment.created_at
    }
  
    { comment: comment_with_user }.to_json
  end
  delete '/comments/:id' do
    comment = Comment.find(params[:id])
    comment.destroy
    response = { message: 'blog deleted successfully' }
    response.to_json
  end
end
