# User Model
# add total_rides attribute --> a list of Rides
# rides_this_month attribute -> list of Rides, refreshes every month

class User < ApplicationRecord

  validates_presence_of :first_name,
                        :last_name,
                        :password,
                        :email,
#                        :cash,
                        :username
  
  validates_uniqueness_of :identifier,
                          :phone,
                          :email,
                          :username
  
  has_one   :membership_type, class_name: :Membership, foreign_key: :membership_id
  has_many  :rides #, through :membership

  #has_secure_password

end 
