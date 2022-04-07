class User < ApplicationRecord
  has_secure_password
  # validates_presence_of :identifier,
  #                       :name,
  #                       :phone,
  #                       :password,
  #                       :email,
  #                       :cash,
  #                       :username
  
  # validates_uniqueness_of :identifier,
  #                         :phone,
  #                         :email,
  #                         :username
  
  # has_one   :membership_type, class_name: :Membership, foreign_key: :membership_id
  # has_many  :rides #, through :membership
    
end
