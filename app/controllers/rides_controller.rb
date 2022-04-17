class RidesController < ApplicationController

    def index
        @rides = Ride.all   
    end

    def new
        @ride = Ride.new
    end

    def create()
        @ride = Ride.new(ride_params)
        @ride.rider_user_id = session[:user_id]
        if @ride.save!
            start_ride(@ride.id)
            redirect_to '/return'
        end

    end

    #private 
    def ride_params
        params.require(:ride).permit(:bike_id, :startstation, :endstation)
    end

end