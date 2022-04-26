class Membership < ApplicationRecord
    validates_presence_of   :identifier,
                            :price,
                            :name

    validates_uniqueness_of :identifier
    
    has_many :users, class_name: :User, foreign_key: :membershipID, primary_key: :identifier
end