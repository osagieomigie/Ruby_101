class UsersController < ApplicationController
    include Response #add response module 

    # GET response, used for retrieving all Users from the DB 
    def index 
        @users = User.all 
        json_response(@users)
    end 

    def show 
    end 

    def create 
    end 

    def update
    end 

    def destroy 
    end 

end
