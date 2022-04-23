class RidesController < ApplicationController

    def index
        @rides = Ride.all   
    end

    def new
        @ride = Ride.new
    end

    def create()
        
        @stat = Station.find_by(name: ride_params[:startstation])
        @bike = Bike.find_by(identifier: ride_params[:bike_id], current_station_id: @stat.identifier)

        if @bike.present?
          
            @ride = Ride.new(ride_params)
            @ride.rider_user_id = session[:user_id]
            if @ride.save!
                @stat.docked_bikes.delete(@bike)
                start_ride(@ride.id)
                @bike = Bike.find_by(identifier: @ride.bike_id)
                @bike.update(current_station_id: nil)
               
                redirect_to '/return'
                        
            end
               
        else
            flash[:warning] = "That bike is not docked at the selected station. Please enter a valid bike id."
            redirect_to '/unlock'
        end

    end

    def update()
        @ride = Ride.find_by(id: current_ride_id, rider_user_id: session[:user_id])
        @ride.update(endstation: ride_params[:endstation])

        @bike = Bike.find_by(identifier: @ride.bike_id)
        @station = Station.find_by(name: ride_params[:endstation])
        @bike.update(current_station_id: @station.identifier)

        end_ride

        redirect_to '/unlock'
    end

    #private 
    def ride_params
        params.require(:ride).permit(:bike_id, :startstation, :endstation)
    end

end