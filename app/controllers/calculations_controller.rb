class CalculationsController < ApplicationController
    include Response 

    def index 
        @calculation = Calculation.all # retrieve all calculations from calculations table 
        json_response(@calculation) # respond with the array of calculations
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
