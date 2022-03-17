Rails.application.routes.draw do
  get 'memberships/show'
  root to: "stations#index"

  get "users/initialize"
  resources :profile 

  get "/stations/desc", to: "stations#show"

  get "/stations/asc", to: "stations#index"

  get "/bikes/bikes-asc", to: "bikes#index"

  get "/bikes/reverse-bikes", to: "bikes#reverse"

end
 