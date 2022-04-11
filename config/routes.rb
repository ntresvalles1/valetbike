Rails.application.routes.draw do


  root 'sessions#map'
  
  
  #user routes
  resources :users 
  #, only: [:new, :create, :edit, :update, :show, :destroy] 
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  #sessions routes
  get '/sessions', to: 'sessions#map'
  
  get '/signup', to:'users#new'
  get '/logged_in_user', to: 'sessions#index'
  get '/profile', to: 'sessions#profile'
  
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'

  get "/stations/desc", to: "stations#show"
  get "/stations/asc", to: "stations#index"
  
  get "/stations/map", to: "stations#map"

  get "/bikes/bikes-asc", to: "bikes#index"
  get "/bikes/reverse-bikes", to: "bikes#reverse"

  get "/aboutus", to: "sessions#aboutus"
  get "/unlock", to: "sessions#unlock"
  get "/pricing", to: "sessions#pricing"

end
