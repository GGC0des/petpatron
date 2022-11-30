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
      @animal = Animal.new(castle_params)
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
