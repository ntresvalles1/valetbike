class MembershipController < ApplicationController

    def index
        @memberships = Membership.all   
    end

    def new
        @memberships = Membership.new
    end

    #private 
    def membership_params
        params.require(:membership).permit(:identifier, :price, :start_date, :end_date,)
    end

end