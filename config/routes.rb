Rails.application.routes.draw do
  root to: "stations#index"

  get "/stations/desc", to: "stations#show"

  get "/stations/asc", to: "stations#index"

  get "/bikes/docked-bikes", to: "bikes#index"

end
