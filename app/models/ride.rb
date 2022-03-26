# distance - approximate distance between the 2 stations 
# time - once user checks out bike, start counting until bike is returned 
class Ride < ApplicationRecord
    attr_reader :distance, :time

    def initialize(distance, time)
        @user_id = user_id
        @distance = distance
        @time = time
    end
end
