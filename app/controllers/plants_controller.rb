class PlantsController < ApplicationController

    wrap_parameters format: []

    # GET /plants 
    def index 
        plants = Plant.all 
        render json: plants
    end

    # GET /plants/:id
    def show 
        plant = Plant.find_by(id: params[:id])
        if plant 
            render json: plant 
        else
            rend json: { error: "Plant not found" }, status: :not_found
        end
    end

    # POST /plants
    def create 
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end

    private 
    # all methods below here are private 

    def plant_params 
        params.permit(:name, :image, :price)
    end
    
end
