Rails.application.routes.draw do
  resources :comments
  resources :blogs
  resources :users, except: [:show, :index]
  post "login", to: "users#login"
  get "blogs/user/:id", to: "blogs#userblog"
  get "latest", to: "blogs#latest"
  get "featured", to: "blogs#featured"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
