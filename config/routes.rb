Rails.application.routes.draw do


  root 'sessions#map'
  
  #ride routes
  resources :ride , only: [:new, :create]

  get '/checkout', to: 'rides#create'
  post '/checkout', to: 'rides#create'
  get '/UNLOCKBIKE', to: 'rides#new'
  get '/checkin', to: 'rides#update'
  post '/checkin', to: 'rides#update'


  #user routes
  resources :users 
  resources :account_activations, only: [:edit]
  resources :password_resets,     only: [:new, :create, :edit, :update]
  
  #sessions routes
  get '/sessions', to: 'sessions#map'
  get '/not_logged_in_user', to:'sessions#index'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#logout'
  get "/aboutus", to: "sessions#aboutus"
  get "/unlock", to: "sessions#unlock"
  get "/pricing", to: "sessions#pricing"
  get '/return', to: 'sessions#return'
  get "/faq", to: "sessions#faq"
  
  #users routes
  get '/signup', to:'users#new'
  get '/logged_in_user', to: 'users#show'   
  get '/profile', to: 'users#show'
  get '/editInfo', to: 'users#editProfile'
  

  get "/stations/desc", to: "stations#show"
  get "/stations/asc", to: "stations#index"
  
  get "/stations/map", to: "stations#map"
  get "/stations/map", to: "stations#map"

  get "/stations/map", to: "stations#map"

  get "/bikes/bikes-asc", to: "bikes#index"
  get "/bikes/reverse-bikes", to: "bikes#reverse"

end
