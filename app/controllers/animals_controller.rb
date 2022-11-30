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
    if user_signed_in?
      @animal = Animal.new
    end
  end

  def create
    if user_signed_in?
      @animal = Animal.new(animal_params)
      @animal.shelter = Shelter.where(user: current_user).first
      if @animal.save
        redirect_to dashboard_path
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  def edit
    @animal = Animal.find(params[:id]) # only owner can edit !
  end

  def update
    @animal = Animal.find(params[:id])
    if @animal.update(animal_params)
      redirect_to animal_path(@animal)
    else
      render :update, status: :unprocessable_entity
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :description, :sex, :size, :species, photos: [])
  end
end
