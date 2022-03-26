class UsersController < ApplicationController
   
    def show
       @users = User.all.order(identifier: :asc)
    end
   
 end
 