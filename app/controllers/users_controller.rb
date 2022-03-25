class UsersController < ApplicationController
   # instance methods - if we do UsersController.new("info"), it'll make instance?
   def initialize(id, name, phone, password, membership, email, numRides, savedCard)
    @cust_id = id
    @cust_name = name
    @cust_phone = phone
    @cust_membership = membership
    @cust_email = email
    @cust_numRides = numRides
    @cust_savedCard = savedCard
   end

   # assign bike to user
   def assignBike
    "#{@name}, your bike number is "
   end

   # gets each attribute from user
   def getAttributes
   end

   # sets the attributes and prints it
   def setAttributes
    puts @cust_id 
    puts @cust_name 
   end

   # adds membership (connect with membershipcontroller)
   def addMembership(membership)
   end
  
  end
    