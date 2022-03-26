class Membership < ApplicationRecord
    attr_reader :membership_id,  :start_date, :end_date, :price

    def initialize(membership_id, start_date, end_date, price)
        @membership_id = membership_id
        @start_date = start_date
        @end_date = end_date
        @price = price(membership_id)
    end

    def price(membership_id)
        if membership_id == "1"
            @price = 40
        if membership_id == "2"
            @price = 15
    end

end
