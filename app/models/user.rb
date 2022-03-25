# User Model
class User < ApplicationRecord
    attr_reader :id 
    attr_accessor :name, :phone, :password, :email

    def initialize(id, name, phone, password, email)
        @id = id
        @name = name
        @phone = phone
        @password = password
        @email = email
   end

end 
