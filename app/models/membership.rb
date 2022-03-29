class Membership < ApplicationRecord
    validates_presence_of   :identifier,
                            :start_date,
                            :end_date,
                            :price

    validates_uniqueness_of :identifier

    belongs_to  :user

    def price(membership_id)
        if membership_id == "1"
            @price = 40
        if membership_id == "2"
            @price = 15
    end

end
