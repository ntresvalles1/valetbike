class StationsController < ApplicationController
  
  # GET /stations
  # GET /stations.json


  helper_method :index

  def index
    @stations = Station.all

    #render json: @stations

    
    #respond_to do |format|
      #format.html
      #format.json do

        #puts "please?"
        #geojson = @stations.map do |station|
          #{
            #type: 'Feature',
            #geometry: {
              #type: 'Point',
              #coordinates: [station.xcoord, station.ycoord]
            #},
            #properties: {
              #name: station.name,
              #address: station.address
            #}
          #}
        #end
    
        #print geojson
        render json: geojson
      #end
    #end
  end


  def map
        @stations = Station.all

        geojson = @stations.map do |station|
          {
            type: 'Feature',
            geometry: {
              type: 'Point',
              coordinates: [station.xcoord, station.ycoord]
            },
            properties: {
              name: station.name,
              address: station.address
            }
          }
        end
    
        render json: geojson

  end


=begin
require 'geojson_model'
require 'json'



def index

  @stations = Station.all

  locations = []

  @stations.map do |station|
  
    puts station.name

    locations << GeojsonModel::Feature.new(
        properties: {name: station.name},
        geometry: GeojsonModel::Geometry.new(type: 'Point', coordinates: [station.xcoord, station.ycoord])
        )
  end

  fc = GeojsonModel::FeatureCollection.new(features: locations)
  puts JSON.pretty_generate(JSON.parse(fc.to_json)))
  render json: JSON.pretty_generate(JSON.parse(fc.to_json)))

  end

=end

end



