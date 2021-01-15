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

    # create new user specific calculations
    def create 
        @new_calculation = Calculation.new(calculate_params) # create Calculation OBject to store request 

        # save error
        if !@new_calculation.save
            #respond with error message
            json_response(@new_calculation.errors.full_messages, 400) 
        else 
            # respond with newly created calculation
            json_response(@new_calculation) 
        end 
    end 

    # updates 
    def update
    end 

    # delete record 
    def destroy 
        user_id = params[:id] # get record id from request 
        @calculation = Calculation.find_by(:id => user_id).destroy # find and delete 
        json_response(@calculation) # respond with the users calculations
    end 

    private 
        # whitelist fields in params(request)
        def calculate_params 
            params.permit(:user_id, :step)
        end 
end
