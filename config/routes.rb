Rails.application.routes.draw do


  root 'sessions#map'
  
  #user routes
  resources :users, only: [:new, :create, :edit, :update, :show, :destroy]
  
  #sessions routes
  get '/login', to: 'sessions#login'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'
  get '/logout', to: 'sessions#destroy'
  
  

  get "/stations/desc", to: "stations#show"
  get "/stations/asc", to: "stations#index"

  get "/bikes/bikes-asc", to: "bikes#index"
  get "/bikes/reverse-bikes", to: "bikes#reverse"

  #get "users/show/:id", to: "users#show"
  get "users/show", to: "users#show"
end
 