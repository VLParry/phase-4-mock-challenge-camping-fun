class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :camper_not_found

def index 
    render json: Camper.all 
end

def show
    camper = Camper.find_by_id(params[:id])
    if camper
        render json: camper, include: :activities
    else
        render json: { error: "Camper not found"}, status: :not_found
    end
end

def create 
    camper = Camper.create(params.permit(:name, :age))
    if camper.valid?
        render json: camper, status: :created
    else
        render json: { errors: ["validation errors"] }, status: :unprocessable_entity
    end 
end



end