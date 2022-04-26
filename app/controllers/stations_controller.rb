class StationsController < ApplicationController

  helper_method :index

  def index
    @stations = Station.all
        render json: geojson
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
              address: station.address,
              docks: station.docks,
              docked_bikes: station.docked_bikes.count
            }
          }
        end
    
        render json: geojson

  end

end



