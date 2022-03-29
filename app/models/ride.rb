# distance - approximate distance between the 2 stations 
# time - once user checks out bike, start counting until bike is returned 
class Ride < ApplicationRecord
    validates_presence_of   :identifier,
                            :time

    validates_uniqueness_of :identifier 

    belongs_to  :membership
    belongs_to  :user

end
