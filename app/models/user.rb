class User < ApplicationRecord
  has_secure_password
  validates_presence_of  :username,
                         :email,
                         :password,
                         :first_name,
                         :last_name

  validates_uniqueness_of :username, inclusion:{message: "Username taken. Please choose another."}
  validates_uniqueness_of :email, inclusion:{message: "Email taken. Please choose another."}
  has_many :rides, class_name: :Ride, foreign_key: :rider_user_id
    
end
