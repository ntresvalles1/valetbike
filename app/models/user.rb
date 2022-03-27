# User Model
# add total_rides attribute --> a list of Rides
# rides_this_month attribute -> list of Rides, refreshes every month

class User < ApplicationRecord
    attr_reader :user_id 
    attr_accessor :name, :phone, :password, :email, :cash

    def initialize(user_id, name, phone, password, email, cash)
        @user_id = user_id
        @name = name
        @phone = phone
        @password = password
        @email = email
        @cash = cash
   end

end 
