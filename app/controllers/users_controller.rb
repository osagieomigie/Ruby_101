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

    #POST request, to update a user 
    def update
        # retrieve user data from request (params)
        email = params[:email]

        # query DB for the specific user 
        user = User.where(:email => email)

        @user = user.update(user_params) #update the user 
        json_response(@user) # return created user, to signify that the user was updated
    end 

    #DELETE request, to delete a user 
    def destroy 
        # retrieve user data from request (params)
        email = params[:email]

        # query DB for the specific user 
        user = User.find_by(:email => email)

        @user = user.destroy #delete the user 
        head :no_content # response sent back to client 
    end 

    private 
        # whitelist the :first_name, :last_name, :email, :notes variables for mass assignment
        def user_params
            params.permit(:first_name, :last_name, :email, :notes)
        end
end
