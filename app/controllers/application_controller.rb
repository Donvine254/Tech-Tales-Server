class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add routes
  get '/' do
    "Hello World"
  end
  get '/blogs' do
    blogs= blog.all
    blogs.to_json
  end
  get '/blogs/:id' do
    blog= blog.find(params[:id])
    blog.to_json
  end
  post '/blogs' do
    new_blog= blog.create(username: params[:username], body: params[:body])
    new_blog.to_json
  end
  patch '/blogs/:id' do
    blog= blog.find(params[:id])
    blog.update(username: params[:username], body: params[:body])
    blog.save
    blog.to_json
  end
  delete '/blogs/:id' do
    blog= blog.find(params[:id])
    blog.destroy
    blog.to_json
  end
end
