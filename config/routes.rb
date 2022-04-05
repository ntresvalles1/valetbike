Rails.application.routes.draw do
  
  
  root to: "homepage#map"
  

  get "/stations/desc", to: "stations#show"

  get "/stations/asc", to: "stations#index"

  get "/stations/map", to: "stations#map"

  get "/bikes/bikes-asc", to: "bikes#index"

  get "/bikes/reverse-bikes", to: "bikes#reverse"

 

  
 

end
