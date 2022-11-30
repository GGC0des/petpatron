class AnimalsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @animals = Animals.all
  end

  def show
    @castle = Castle.find(params[:id])
    @caretaking = Caretaking.new
  end

  def new
    @animal = Animal.new
  end

  def create
    animal = Animal.new(castle_params)
  end


  private

  def castle_params
    params.require(:castle).permit(:name, :location, :description, :price, photos: [])
  end

end
