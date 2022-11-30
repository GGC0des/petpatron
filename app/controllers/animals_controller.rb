class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = Animals.all
  end

  def show
    @animal = Animal.find(params[:id])
    @caretaking = Caretaking.new
  end

  def new
    @animal = Animal.new
  end

  def create
    animal = Animal.new(castle_params)
    shelter.user = current_user if user_signed_in?
    if shelter.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @shelter = Shelter.find(params[:id]) # only owner can edit !
  end

  def update
    @shelter = Shelter.find(params[:id])
    if @shelter.update(shelter_params)
      redirect_to shelter_path(@shelter)
    else
      render :update, status: :unprocessable_entity
    end
  end

  private

  def castle_params
    params.require(:castle).permit(:name, :location, :description, :price, photos: [])
  end
end
