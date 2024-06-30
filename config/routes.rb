Rails.application.routes.draw do
  resources :social_media
  resources :comments
  resources :blogs
  resources :users
  post 'login', to: 'users#login'
  patch 'reset', to: 'users#reset'
  get 'blogs/user/:id', to: 'blogs#userblog'
  get 'latest', to: 'blogs#latest'
  get 'featured', to: 'blogs#featured'
  get '/comments/blogs/:id', to: 'comments#blogcomments'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
