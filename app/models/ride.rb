class Ride < ApplicationRecord
    validates_presence_of   :bike_id,
                            :startstation
                            #:rider_user_id
                            #:identifier,
                            #:starttime
                            #:endstation
                            #:endtime
                            #:membershipid
                            

    belongs_to :rider, class_name: :User, foreign_key: :rider_user_id, optional: true
    #validates_uniqueness_of :identifier 

    #belongs_to: memebrship
    #belongs_to  :user

end
