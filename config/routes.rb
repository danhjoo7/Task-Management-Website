Rails.application.routes.draw do
  resources :comments
  resources :tasks
  resources :users
  get "/", to: 'pages#home', as: 'home'
  get "/signup", to: "users#new", as: "signup"
  post "/signup", to: "users#create", as: "signup_complete"
  get "/login", to: "sessions#new", as: "login"
  post "/login", to: "sessions#create", as: "sessions"
  delete "/logout", to: "sessions#destroy", as: "logout"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
end
