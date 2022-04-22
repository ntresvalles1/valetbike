class RidesController < ApplicationController

    def index
        @rides = Ride.all   
    end

    def new
        @ride = Ride.new
    end

    def create()
        
        @stat = Station.find_by(name: ride_params[:startstation])
        #checked = false

        @bike = Bike.find_by(identifier: ride_params[:bike_id], current_station_id: @stat.identifier)

        #if check_bike_at_station(ride_params[:startstation], ride_params[:bike_id])?
        if @bike.present?
          
            @ride = Ride.new(ride_params)
            @ride.rider_user_id = session[:user_id]
            if @ride.save!
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

    #def check_bike_at_station(station_name, bike_id)
        #@stat = Station.find_by(name: ride_params[:startstation])
        #checked = false
        #if @stat.present?  
            #for bike in @stat.bikes
                #if bike.id == ride_params[:bike_id] do
                    #checked = true

                #end
            #end
        #end
        #checked?

    #end

    def update()
        @ride = Ride.find_by(id: current_ride_id, rider_user_id: session[:user_id])
        @ride.update(endstation: ride_params[:endstation])

        @bike = Bike.find_by(identifier: @ride.bike_id)
        @station = Station.find_by(name: ride_params[:endstation])
        @bike.update(current_station_id: @station.identifier)

        end_ride

        #flash[:success] = "Bike returned!"
        redirect_to '/unlock'
    end

    #private 
    def ride_params
        params.require(:ride).permit(:bike_id, :startstation, :endstation)
    end

end