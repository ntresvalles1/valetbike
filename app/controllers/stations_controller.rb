class StationsController < ApplicationController
  
  def index
    @stations = Station.all.order(identifier: :asc)
  end

  def show
    @stations = Station.all.order(identifier: :desc)
  end
  
end
