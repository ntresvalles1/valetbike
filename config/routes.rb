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
  resources :users , only: [:new, :create, :edit, :update, :show, :destroy] 
  
  #sessions routes
  get '/sessions', to: 'sessions#map'
  get '/return', to: 'sessions#return'

  
  get '/signup', to:'users#new'
  #get '/logged_in_user', to: 'users#show'
  get '/not_logged_in_user', to:'sessions#index'
  #get '/profile', to: 'sessions#profile'
  get '/profile', to: 'users#show'
  get '/editInfo', to: 'users#editProfile'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  #delete '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#logout'

  get "/stations/desc", to: "stations#show"
  get "/stations/asc", to: "stations#index"

  get "/stations/map", to: "stations#map"

  get "/bikes/bikes-asc", to: "bikes#index"
  get "/bikes/reverse-bikes", to: "bikes#reverse"

  get "/aboutus", to: "sessions#aboutus"
  
  get "/unlock", to: "sessions#unlock"
  
  get "/pricing", to: "sessions#pricing"

  get "/faq", to: "sessions#faq"
end
