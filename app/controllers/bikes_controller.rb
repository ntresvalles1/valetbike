class BikesController < ApplicationController
  
  def index
    @bikes = Bike.all.order(identifier: :asc)
  end
  
  def reverse
    @bikes = Bike.all.order(identifier: :desc)
  end

end
  