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
            flash[:success] = "Bike unlocked!"
        end

    end

    def update()
        @ride = Ride.find_by(id: current_ride_id, rider_user_id: session[:user_id])
        @ride.update(endstation: ride_params[:endstation])
        end_ride
        flash[:success] = "Bike returned!"
        redirect_to '/unlock'
    end

    #private 
    def ride_params
        params.require(:ride).permit(:bike_id, :startstation, :endstation)
    end

end