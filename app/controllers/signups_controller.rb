class SignupsController < ApplicationController

    def create 
        signup = Signup.create(params.permit(:camper_id, :activity_id, :time))
        if signup.valid?
            render json: signup.activity, status: :created
        else
            render json: { errors: ["validation errors"] }, status: :unprocessable_entity
        end 
    end
end