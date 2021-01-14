class CalculationsController < ApplicationController
    include Response 

    # display all calculations made 
    def index 
        @calculation = Calculation.all # retrieve all calculations from calculations table 
        json_response(@calculation) # respond with the array of calculations
    end 

    # display a specific calculation, associated with a user 
    def show 
        user_id = params[:user_id] # get user id from request 
        @calculation = Calculation.find_by(:user_id => user_id)
        json_response(@calculation) # respond with the users calculations
    end 

    def create 
    end 

    def update
    end 

    def destroy 
    end 
    
end
