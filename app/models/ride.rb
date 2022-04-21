class Ride < ApplicationRecord
    validates_presence_of   :bike_id,
                            :startstation
                            

    belongs_to :rider, class_name: :User, foreign_key: :rider_user_id, optional: true

end
