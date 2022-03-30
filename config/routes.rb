Rails.application.routes.draw do


  root 'sessions#map'
  
  #user routes
  resources :users , only: [:new, :create, :edit, :update, :show, :destroy] 
  
  #sessions routes
  get '/sessions', to: 'sessions#map'
  
  get '/signup', to:'users#new'
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  

  get "/stations/desc", to: "stations#show"
  get "/stations/asc", to: "stations#index"

  get "/bikes/bikes-asc", to: "bikes#index"
  get "/bikes/reverse-bikes", to: "bikes#reverse"


end
