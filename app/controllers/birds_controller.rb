class BirdsController < ApplicationController
  wrap_parameters format: [] # disabling wrap parameters feature 

  # GET /birds
  def index
    birds = Bird.all
    render json: birds
  end

  # POST /birds
  def create
    # bird = Bird.create(name: params[:name], species: params[:species])
    #bird = Bird.create(params.permit(:name, :species))
    bird = Bird.create(bird_params) # after refactoring 
    render json: bird, status: :created
  end

  # GET /birds/:id
  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird
    else
      render json: { error: "Bird not found" }, status: :not_found
    end
    private
  
  # REFACTORING PARAMS
  # all methods below here are private

  def bird_params
    params.permit(:name, :species)
  end

  end

end
