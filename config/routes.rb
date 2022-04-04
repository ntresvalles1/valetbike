Rails.application.routes.draw do
  
  #root to: "stations#map"
  root to: "homepage#map"
  #root to: "bikes#index"

  get "/stations/desc", to: "stations#show"

  get "/stations/asc", to: "stations#index"

  get "/stations/map", to: "stations#map"

  get "/bikes/bikes-asc", to: "bikes#index"

  get "/bikes/reverse-bikes", to: "bikes#reverse"

 # get "/stations.json"

  
 

end
