class SignupsController < ApplicationController
    def new
        @signup = Signup.new
    end
    
    def create
        @signup = Signup.create(su_params)
        
        if @signup.valid?
            redirect_to camper_path(@signup.camper)
        else
            flash[:my_errors] = @signup.errors.full_messages
            redirect_to new_signup_path
        end

    end

    private

    def su_params
        params.require(:signup).permit(:camper_id, :activity_id, :su_time)
    end
end
