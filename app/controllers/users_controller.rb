class UsersController < ApplicationController

    include Response #add response module 

    # GET request, used for retrieving all Users from the DB 
    def index 
        @users = User.all 
        json_response(@users)
    end 

    # GET request, used for retrieving a specific User 
    def show 
        # retrieve user data from request (params)
        first_name = params[:first_name]
        last_name = params[:last_name]
        email = params[:email]

        # query DB for the retieved data
        @user = User.where({:first_name => first_name, :last_name => last_name, :email => email})
        json_response(@user)
    end 

    # POST request, to create a User
    def create 
        @user = User.create(user_params)
        json_response(@user) # return created user, to signify that the user was created
    end 

    def update
    end 

    def destroy 
    end 

    private 
        # whitelist the :first_name, :last_name, :email, :notes variables for mass assignment
        def user_params 
            params.permit(:first_name, :last_name, :email, :notes)
        end 
end
