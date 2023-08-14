Rails.application.routes.draw do
  resources :comments
  resources :blogs
  resources :users, except: [:show, :index]
  post "login", to: "users#login"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
